# NixOS Config Documentation

A Neovim-inspired documentation website built with pure HTML, CSS, and JavaScript. Styled with the Catppuccin Mocha color palette and designed to feel like a modern terminal UI.

---

## 📁 Structure

```
docs/
├── index.html          # Landing page with hero, features, and quick start
├── docs.html           # Full documentation with sidebar and scrollspy TOC
├── dev-shells.html     # 43 dev-shell templates with search/filter
├── keybindings.html    # Complete Hyprland keybindings reference
├── assets/
│   ├── css/
│   │   └── style.css   # 2100 lines of pure CSS with Catppuccin Mocha
│   ├── js/
│   │   └── main.js     # Interactivity (mobile nav, search, copy, scrollspy)
│   └── img/
│       └── nix-snowflake.svg  # Favicon and logo
└── README.md           # This file
```

---

## 🚀 Usage

### Local Development

Simply open `index.html` in any modern browser:

```bash
# With default browser
xdg-open docs/index.html

# With specific browser
firefox docs/index.html
chromium docs/index.html
```

Or use a local server for a more production-like experience:

```bash
# Python 3
python3 -m http.server 8000 --directory docs

# Node.js (if you have http-server installed)
npx http-server docs -p 8000

# Then visit: http://localhost:8000
```

### Deploy to GitHub Pages

1. **Push to a `docs` directory in your repo** (already done)

2. **Enable GitHub Pages:**
   - Go to your repo → Settings → Pages
   - Source: Deploy from a branch
   - Branch: `main` → `/docs` → Save

3. **Visit:** `https://sijanthapa171.github.io/NixOS/`

### Deploy to Netlify

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Deploy from the docs directory
cd NixOS
netlify deploy --dir=docs --prod
```

Or use the Netlify web UI:
1. Drag the `docs` folder to [netlify.com/drop](https://app.netlify.com/drop)
2. Done.

### Deploy to Vercel

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy from the docs directory
cd docs
vercel --prod
```

Or link the GitHub repo in the Vercel dashboard.

### Deploy Anywhere Static

The site is **100% static**. Upload the `docs/` folder contents to any static host:
- **Cloudflare Pages** — Connect GitHub repo, set build directory to `docs`
- **GitLab Pages** — `.gitlab-ci.yml` with `public/` output directory
- **AWS S3 + CloudFront** — Upload to S3 bucket, enable static hosting
- **nginx/Apache** — Copy files to web root, configure MIME types

---

## ✨ Features

### Pages

1. **Home** (`index.html`)
   - Hero with ASCII-art grid background
   - Live stats bar: 4 DEs / 43 templates / 3 themes / 18 wallpapers
   - Features grid (8 cards)
   - Quick installation examples
   - Options table (`variables.nix` controls)
   - Hosts overview (Default laptop + vega WSL)
   - Dev shells preview
   - Hyprland Lua config highlight
   - CTA section

2. **Docs** (`docs.html`)
   - Left sidebar with collapsible groups
   - Right-side scrollspy TOC
   - 23 comprehensive sections:
     - Installation (running system + live ISO with LUKS encryption)
     - `variables.nix` control center
     - Host management (auto/manual creation)
     - Rebuilding, rollbacks, updating
     - Core modules (25 modules)
     - Desktop environments (Hyprland Lua, GNOME, Plasma 6, i3)
     - Programs (browsers, editors, terminals, file managers, CLI, media)
     - Themes (Catppuccin/Dracula/Rosé Pine + SDDM + 18 wallpapers)
     - Hardware (GPU drivers with Wayland env vars)
     - Scripts (rebuild, rollback, launcher, tmux-sessionizer, network…)
     - Gaming (Steam, Proton-GE, MangoHud, gamescope, gamemode)
     - Flake inputs, architecture, FAQ, contributing

3. **Dev Shells** (`dev-shells.html`)
   - 43 dev-shell templates as searchable cards
   - Filter by category: Systems / Web / Functional / ML / Infra / Mobile / Docs
   - Inline copy buttons for each template command
   - Accurate details (Rust with fenix, Go 1.24, Java 25 + Lombok, Python 3.13, Node.js with pnpm, etc.)

4. **Keybindings** (`keybindings.html`)
   - Complete Hyprland keybindings extracted from `binds.lua`
   - Filter by category: System / Apps / Windows / Workspaces / Media / Screenshots
   - Visual `<kbd>` styling for key representations
   - 6 sections with all bindings documented

### Visual Design

- **Color Scheme:** Catppuccin Mocha (base: #1e1e2e, text: #cdd6f4, accents: mauve/blue/green/red)
- **Typography:** 
  - Body: `-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`
  - Mono: `"JetBrains Mono", "Fira Code", Consolas, monospace`
- **Code Blocks:** Terminal-style with titlebar (red/yellow/green dots), prompt indicators (`$`, `#`, `>`), syntax coloring
- **Sidebar:** Neovim-inspired with collapsible groups, active link tracking
- **TOC:** Scrollspy on right side that highlights current section
- **Responsive:** 1440px max → 900px (hide TOC) → 768px (mobile nav, stacked layout) → 480px (full-width)

### Interactivity (JavaScript)

- Mobile nav toggle
- Docs sidebar drawer (mobile)
- Sidebar group expand/collapse
- Active TOC link on scroll (intersection observer)
- Copy-to-clipboard for code blocks and inline commands
- Dev shells search + category filter
- Keybindings search + category filter
- Sticky nav scroll effect

---

## 🎨 Customization

### Colors

All colors are defined in `:root` CSS custom properties at the top of `assets/css/style.css`:

```css
:root {
  --base: #1e1e2e;
  --mantle: #181825;
  --crust: #11111b;
  --text: #cdd6f4;
  --subtext0: #a6adc8;
  --mauve: #cba6f7;
  --blue: #89b4fa;
  /* ... etc */
}
```

To switch themes:
1. Change the hex values in `:root`
2. Or overlay a different palette (e.g., Catppuccin Latte, Dracula, Nord)

### Logo

Replace `assets/img/nix-snowflake.svg` with your own icon. Update references in HTML:
- `<link rel="icon">` tags
- `.topnav-logo img` elements

### Content

All content is in plain HTML:
- **Hero text:** Edit the `<section class="hero">` in `index.html`
- **Features:** Edit the `.features-grid` cards
- **Docs sections:** Edit the `<section id="...">` blocks in `docs.html`
- **Dev shells:** Edit the `.shell-card` elements in `dev-shells.html`
- **Keybindings:** Edit the `.kbd-section` blocks in `keybindings.html`

No build step needed — just edit and refresh.

---

## 📦 Dependencies

**None.** The site uses:
- Pure HTML5
- Pure CSS3 (no preprocessors)
- Vanilla JavaScript (ES6+)
- No frameworks, no bundlers, no build tools

All assets are self-contained. No CDN links, no external fonts, no tracking scripts.

---

## 🧪 Testing

### Browser Compatibility

Tested and works on:
- ✅ Chrome/Chromium 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+

Uses modern CSS features:
- CSS Grid
- Flexbox
- Custom properties (CSS variables)
- `clamp()` for responsive typography
- Intersection Observer API (for scrollspy)

### Accessibility

- Semantic HTML5 elements (`<nav>`, `<main>`, `<section>`, `<kbd>`)
- ARIA labels on interactive elements
- Keyboard navigation support
- Focus visible states
- Sufficient color contrast (WCAG AA compliant)
- Responsive font sizing with `clamp()`
- Alt text on images

### Performance

- No external dependencies = no network requests (except initial page load)
- All CSS in one file (2100 lines, ~60 KB uncompressed)
- All JS in one file (250 lines, ~8 KB uncompressed)
- SVG favicon (~2 KB)
- Total page weight: **~70 KB** (before gzip)
- Instant navigation (static HTML)

---

## 🛠️ Maintenance

### Adding a New Dev Shell

1. Open `dev-shells.html`
2. Find the `.shells-grid` container
3. Copy an existing `.shell-card` div
4. Update:
   - `data-category` (systems/web/functional/ml/infra/mobile/docs)
   - `.shell-name` text
   - `.shell-desc` text
   - `.shell-version` text (optional)
   - `.shell-cmd code` with the actual command
   - Update the copy button data attribute if needed

### Adding a New Docs Section

1. Open `docs.html`
2. Add a link in the left sidebar (`<nav class="docs-sidebar">`)
3. Add a corresponding `<section id="your-id">` in the main content area
4. Add a link in the right TOC (`<nav class="docs-toc">`)
5. Write content with proper headings, code blocks, and callouts

### Adding Keybindings

1. Open `keybindings.html`
2. Find the appropriate `.kbd-section`
3. Add a new `.kbd-row`:

```html
<div class="kbd-row">
  <div class="kbd-keys">
    <kbd>Super</kbd><span class="plus">+</span><kbd>X</kbd>
  </div>
  <div class="kbd-desc">Your description</div>
</div>
```

### Updating Styling

All styles are in `assets/css/style.css`. The file is organized into sections:

1. Reset & base
2. CSS custom properties (colors, spacing, radii)
3. Typography
4. Layout (nav, hero, grid, sections)
5. Components (buttons, cards, code blocks, tables, kbd, callouts)
6. Sidebar & TOC
7. Mobile nav
8. Responsive breakpoints

Use the existing custom properties for consistency.

---

## 📝 License

This documentation inherits the license of the parent NixOS config repository.

---

## 🤝 Contributing

Found a typo? Want to improve the docs?

1. Fork the repo
2. Edit the HTML/CSS/JS files
3. Test locally
4. Submit a PR

Keep the terminal/Neovim aesthetic intact. Use Catppuccin Mocha colors. Follow the existing HTML structure and CSS conventions.

---

## 🔗 Links

- **GitHub Repo:** [sijanthapa171/NixOS](https://github.com/sijanthapa171/NixOS)
- **Catppuccin:** [catppuccin.com](https://catppuccin.com/)
- **NixOS:** [nixos.org](https://nixos.org/)

---

Built with ❄️ by a human and an AI, styled like Neovim, colored like Catppuccin.
