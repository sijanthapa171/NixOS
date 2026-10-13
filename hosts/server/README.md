# Server Host

Headless NixOS host for deploying fullstack web applications.

## Stack

| Service | Purpose |
|---|---|
| **nginx** | Reverse proxy + TLS (Let's Encrypt) |
| **PostgreSQL 16** | Primary database |
| **Redis** | Cache / session store / queue |
| **Docker** | Container runtime |
| **OpenSSH** | Remote access |

## Before First Deploy

**1. Set your domain and email in `variables.nix`:**
```nix
domain = "yourdomain.com";
```

**2. Update the ACME email in `modules/services/fullstack.nix`:**
```nix
defaults.email = "you@yourdomain.com";
```

**3. Change default passwords** — never leave these in production:
- PostgreSQL: search `changeme` in `fullstack.nix`
- Redis: search `changeme_redis` in `fullstack.nix`

Prefer using `sops-nix` or environment files to manage secrets.

**4. Generate hardware config on the target machine:**
```bash
nixos-generate-config --show-hardware-config > hosts/server/hardware-configuration.nix
```

## Deploy

```bash
nixos-rebuild switch --flake .#server --target-host root@<server-ip>
```

## App Deployment

App binaries/bundles go in `/srv/app/`:

```
/srv/app/
├── frontend/   # e.g. Next.js / SvelteKit output
└── backend/    # e.g. compiled Go / Node API
```

The systemd units `fullstack-frontend` and `fullstack-backend` are defined in
`fullstack.nix` but disabled by default (`enable = false`). Once your app is
in place, set them to `enable = true` and update the `ExecStart` paths, then redeploy.

### Default ports

| Service | Port |
|---|---|
| Frontend | 3000 |
| Backend API | 8000 |
| PostgreSQL | 5432 |
| Redis | 6379 |

nginx proxies `yourdomain.com` → frontend and `api.yourdomain.com` → backend.

## Useful Commands

```bash
# Check service status
systemctl status nginx postgresql redis-main

# View nginx logs
journalctl -u nginx -f

# Connect to the database
psql -U appuser -d appdb

# Manage containers
lazydocker
```
