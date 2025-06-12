{ inputs
, lib
, pkgs
, terminal
, ...
}: {
  imports = [
    ../../themes/Catppuccin # Catppuccin GTK and QT themes
    ./programs/waybar
    ./programs/wlogout
    ./programs/rofi
    ./programs/dunst
    ./programs/hyprlock
    ./programs/swaync
  ];

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org/" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  home-manager.sharedModules =
    let
      inherit (lib) getExe getExe';
    in
    [
      ({ ... }: {
        imports = [
          inputs.hyprland.homeManagerModules.default
        ];

        home.packages = with pkgs; [
          # blueman
          hyprpaper
          cliphist
          grimblast
          libnotify
          networkmanagerapplet
          pamixer
          pavucontrol
          playerctl
          brightnessctl
          slurp
          swappy
          swaynotificationcenter
          waybar
          wtype
          wl-clipboard

          sass
        ];

        xdg.configFile."hypr/scripts" = {
          source = ./scripts;
          recursive = true;
        };
        xdg.configFile."hypr/icons" = {
          source = ./icons;
          recursive = true;
        };

        #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
        wayland.windowManager.hyprland = {
          enable = true;
          xwayland.enable = true;
          plugins = [
            # inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
            # inputs.hyprland-plugins.packages.${pkgs.system}.hyprwinwrap
          ];
          systemd = {
            enable = true;
            variables = [ "--all" ];
          };
          settings = {
            "$scriptsDir" = "XDG_BIN_HOME";
            "$hyprScriptsDir" = "$XDG_CONFIG_HOME/hypr/scripts";
            "$mainMod" = "SUPER";
            # "$launcher" = "pkill rofi || rofi -show drun -modi drun,filebrowser,run,window -theme $XDG_CONFIG_HOME/rofi/launchers/type-4/style-7.rasi";
            # "$launcher" = "pkill rofi || rofi -show drun -modi drun,filebrowser,run,window -theme $XDG_CONFIG_HOME/rofi/launchers/type-4/style-3.rasi";
            "$launcher" = "pkill rofi || rofi -show drun -modi drun,filebrowser,run,window -theme $XDG_CONFIG_HOME/rofi/launchers/type-2/style-2.rasi";
            "$term" = "${getExe pkgs.${terminal}}";
            "$editor" = "code --disable-gpu";
            "$file" = "$term -e lf";
            "$browser" = "firefox";

            env = [
              "XDG_CURRENT_DESKTOP,Hyprland"
              "XDG_SESSION_DESKTOP,Hyprland"
              "XDG_SESSION_TYPE,wayland"
              "GDK_BACKEND,wayland,x11,*"
              "NIXOS_OZONE_WL,1"
              "ELECTRON_OZONE_PLATFORM_HINT,auto"
              "MOZ_ENABLE_WAYLAND,1" # disable if You're having issues with firefox
              "OZONE_PLATFORM,wayland"
              "QT_QPA_PLATFORM,wayland;xcb"
              "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
              "QT_QPA_PLATFORMTHEME,qt6ct"
              "QT_AUTO_SCREEN_SCALE_FACTOR,1"
              "WLR_RENDERER_ALLOW_SOFTWARE,1"
              "NIXPKGS_ALLOW_UNFREE,1"
              "WLR_DRM_NO_ATOMIC,1" # ADDED
            ];
            exec-once = [

              "hyprpaper"
              "sleep 1 && waybar"
              "swaync"
              "pamixer --set-volume 50"
              # "dunst"
              # "blueman-applet"
              "nm-applet --indicator"
              "wl-clipboard-history -t"
              "${getExe' pkgs.wl-clipboard "wl-paste"} --type text --watch cliphist store" # clipboard store text data
              "${getExe' pkgs.wl-clipboard "wl-paste"} --type image --watch cliphist store" # clipboard store image data
              "rm '$XDG_CACHE_HOME/cliphist/db'" # Clear clipboard
              "$hyprScriptsDir/batterynotify.sh" # battery notification
              "polkit-agent-helper-1"
              #"systemctl start --user polkit-kde-authentication-agent-1"
              "bat cache --build"
              "swww kill;swww-daemon"
            ];
            input = {
              kb_layout = "fr";
              kb_variant = "azerty";
              repeat_delay = 300; # or 212
              repeat_rate = 30;

              follow_mouse = 1;

              touchpad = { natural_scroll = true; };

              sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
              force_no_accel = true;
            };
            general = {
              gaps_in = 4;
              gaps_out = 9;
              # TODO modify active color it is too bright :(
              border_size = 2;
              "col.active_border" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
              "col.inactive_border" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
              resize_on_border = true;
              layout = "dwindle"; # dwindle or master
              # allow_tearing = true; # Allow tearing for games (use immediate window rules for specific games or all titles)
            };

            decoration = {
              rounding = 15;
              shadow.enabled = false;
              blur = {
                enabled = true;
                size = 6;
                passes = 3;
                ignore_opacity = true;
                popups = true;
                new_optimizations = true;
                xray = true;
              };
              inactive_opacity = 0.85;
              active_opacity = 0.965;
              fullscreen_opacity = 0.965;
            };

            group = {
              "col.border_active" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
              "col.border_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
              "col.border_locked_active" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
              "col.border_locked_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
            };
            layerrule = [
              "blur, rofi"
              "ignorezero, rofi"
              "ignorealpha 0.7, rofi"

              "blur, swaync-control-center"
              "blur, swaync-notification-window"
              "ignorezero, swaync-control-center"
              "ignorezero, swaync-notification-window"
              "ignorealpha 0.7, swaync-control-center"
              # "ignorealpha 0.8, swaync-notification-window"
              # "dimaround, swaync-control-center"
            ];
            animations = {
              enabled = true;
              bezier = [
                "wind, 0.05, 0.9, 0.1, 1.05"
                "winIn, 0.1, 1.1, 0.1, 1.1"
                "winOut, 0.3, -0.3, 0, 1"
                "liner, 1, 1, 1, 1"
              ];
              animation = [
                "windows, 1, 6, wind, slide"
                "windowsIn, 1, 6, winIn, slide"
                "windowsOut, 1, 5, winOut, slide"
                "windowsMove, 1, 5, wind, slide"
                "border, 1, 1, liner"
                "borderangle, 1, 30, liner, loop"
                "fade, 1, 10, default"
                "workspaces, 1, 5, wind"
              ];
            };

            render = {
              explicit_sync = 2; # 0 = off, 1 = on, 2 = auto based on gpu driver.
              explicit_sync_kms = 2; # 0 = off, 1 = on, 2 = auto based on gpu driver.
              direct_scanout = true; # Set to true for improved Fullscreen performance.
            };
            misc = {
              disable_hyprland_logo = true;
              mouse_move_focuses_monitor = true;
              vfr = true; # always keep on
              vrr = true; # enable variable refresh rate (effective depending on hardware)
            };
            gestures = {
              workspace_swipe = true;
              workspace_swipe_fingers = 3;
            };
            dwindle = {
              pseudotile = true;
              preserve_split = true;
            };
            master = {
              new_status = "master";
              new_on_top = true;
              mfact = 0.5;
            };
            windowrulev2 = [

              # Allow screen tearing for reduced input latency on some games.
              #"immediate, class:^(cs2)$"
              #"immediate, class:^(steam_app_0)$"
              #"immediate, class:^(steam_app_1)$"
              #"immediate, class:^(steam_app_2)$"
              #"immediate, class:^(.*)(.exe)$"

              "opacity 0.80 0.80,class:^(alacritty)$"
              "opacity 1.00 1.00,class:^(firefox)$"
              "opacity 0.90 0.90,class:^(Brave-browser)$"
              "opacity 0.80 0.80,class:^(Steam)$"
              "opacity 0.80 0.80,class:^(steam)$"
              "opacity 0.80 0.80,class:^(steamwebhelper)$"
              "opacity 0.80 0.80,class:^(Spotify)$"
              "opacity 0.80 0.80,title:(.*)(Spotify)(.*)$"
              "opacity 0.80 0.80,class:^(Code)$"
              "opacity 0.80 0.80,class:^(code-url-handler)$"
              "opacity 0.80 0.80,class:^(kitty)$"
              "opacity 0.80 0.80,class:^(org.kde.dolphin)$"
              "opacity 0.80 0.80,class:^(org.kde.ark)$"
              "opacity 0.80 0.80,class:^(nwg-look)$"
              "opacity 0.80 0.80,class:^(qt5ct)$"
              "opacity 0.80 0.80,class:^(qt6ct)$"

              "opacity 0.90 0.90,class:^(com.github.rafostar.Clapper)$" #Clapper-Gtk
              "opacity 0.80 0.80,class:^(com.github.tchx84.Flatseal)$" #Flatseal-Gtk
              "opacity 0.80 0.80,class:^(hu.kramo.Cartridges)$" #Cartridges-Gtk
              "opacity 0.80 0.80,class:^(com.obsproject.Studio)$" #Obs-Qt
              "opacity 0.80 0.80,class:^(gnome-boxes)$" #Boxes-Gtk
              "opacity 0.80 0.80,class:^(discord)$" #Discord-Electron
              "opacity 0.80 0.80,class:^(WebCord)$" #WebCord-Electron
              "opacity 0.80 0.80,class:^(app.drey.Warp)$" #Warp-Gtk
              "opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$" #ProtonUp-Qt
              "opacity 0.80 0.80,class:^(yad)$" #Protontricks-Gtk
              "opacity 0.80 0.80,class:^(Signal)$" #Signal-Gtk
              "opacity 0.80 0.80,class:^(io.gitlab.theevilskeleton.Upscaler)$" #Upscaler-Gtk

              "opacity 0.80 0.70,class:^(pavucontrol)$"
              "opacity 0.80 0.70,class:^(blueman-manager)$"
              "opacity 0.80 0.70,class:^(nm-applet)$"
              "opacity 0.80 0.70,class:^(nm-connection-editor)$"
              "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"

              "float,class:^(qt5ct)$"
              "float,class:^(nwg-look)$"
              "float,class:^(org.kde.ark)$"
              "float,class:^(Signal)$" #Signal-Gtk
              "float,class:^(com.github.rafostar.Clapper)$" #Clapper-Gtk
              "float,class:^(app.drey.Warp)$" #Warp-Gtk
              "float,class:^(net.davidotek.pupgui2)$" #ProtonUp-Qt
              "float,class:^(yad)$" #Protontricks-Gtk
              "float,class:^(eog)$" #Imageviewer-Gtk
              "float,class:^(io.gitlab.theevilskeleton.Upscaler)$" #Upscaler-Gtk
              "float,class:^(pavucontrol)$"
              "float,class:^(blueman-manager)$"
              "float,class:^(nm-applet)$"
              "float,class:^(nm-connection-editor)$"
              "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
            ];

            bind = [

              # Resize windows
              "$mainMod SHIFT, right, resizeactive, 80 0"
              "$mainMod SHIFT, left, resizeactive, -80 0"
              "$mainMod SHIFT, up, resizeactive, 0 -80"
              "$mainMod SHIFT, down, resizeactive, 0 80"

              # Resize windows with hjkl keys
              "$mainMod SHIFT, l, resizeactive, 30 0"
              "$mainMod SHIFT, h, resizeactive, -30 0"
              "$mainMod SHIFT, k, resizeactive, 0 -30"
              "$mainMod SHIFT, j, resizeactive, 0 30"

              # Night Mode (lower value means warmer temp)
              "$mainMod, F9, exec, ${getExe pkgs.wlsunset} -t 3000 -T 3900"
              "$mainMod, F10, exec, pkill wlsunset"

              # Window/Session actions
              "$mainMod, Q, exec, killactive"

              "$mainMod, delete, exit" # kill hyperland session
              "$mainMod, W, togglefloating" # toggle the window on focus to float
              "$mainMod SHIFT, G, togglegroup" # toggle the window on focus to float
              "ALT, return, fullscreen" # toggle the window on focus to fullscreen
              "$mainMod ALT, L, exec, hyprlock" # lock screen
              "$mainMod, backspace, exec, wlogout -b 4" # logout menu
              "$CONTROL, ESCAPE, exec, killall waybar || waybar" # toggle waybar

              "$mainMod, Return, exec, $term"
              "$mainMod, T, exec, $term"
              "$mainMod, E, exec, $file"
              "$mainMod, C, exec, $editor"
              "$mainMod, F, exec, $browser"
              "$CONTROL ALT, DELETE, exec, $term -e '${getExe pkgs.btop}'" # system monitor

              "$mainMod, A, exec, pkill -x rofi || $launcher" # launch desktop applications
              "$mainMod, Z, exec, pkill -x rofi || $hyprScriptsDir/emoji.sh" # launch emoji picker
              "$mainMod SHIFT, Q, exec, swaync-client -t -sw" # swayNC panel

              # Waybar
              "$mainMod, B, exec, pkill -SIGUSR1 waybar" # Toggle hide/show waybar

              # Screenshot/Screencapture
              "$mainMod, P, exec, $hyprScriptsDir/screenshot.sh s" # drag to snip an area / click on a window to print it
              "$mainMod CTRL, P, exec, $hyprScriptsDir/screenshot.sh sf" # frozen screen, drag to snip an area / click on a window to print it
              "$mainMod, print, exec, $hyprScriptsDir/screenshot.sh m" # print focused monitor
              "$mainMod ALT, P, exec, $hyprScriptsDir/screenshot.sh p" # print all monitor outputs

              # Functional keybinds
              ",xf86Sleep, exec, systemctl suspend" # Put computer into sleep mode
              ",XF86AudioMicMute,exec,pamixer --default-source -t" # mute mic
              ",XF86AudioMute,exec,pamixer -t" # mute audio
              ",XF86AudioPlay,exec,playerctl play-pause" # Play/Pause media
              ",XF86AudioPause,exec,playerctl play-pause" # Play/Pause media
              ",xf86AudioNext,exec,playerctl next" # go to next media
              ",xf86AudioPrev,exec,playerctl previous" # go to previous media

              "$mainMod, ampersand, workspace, 1"
              "$mainMod, eacute, workspace, 2"
              "$mainMod, quotedbl, workspace, 3"
              "$mainMod, apostrophe, workspace, 4"
              "$mainMod, parenleft, workspace, 5"
              "$mainMod, minus, workspace, 6"
              "$mainMod, egrave, workspace, 7"
              "$mainMod, underscore, workspace, 8"
              "$mainMod, Ccedilla, workspace, 9"
              "$mainMod, agrave, workspace, 10"

              # move to the first empty workspace instantly with mainMod + CTRL + [↓]
              "$mainMod CTRL, down, workspace, empty"

              # Move focus with mainMod + arrow keys
              "$mainMod, left, movefocus, l"
              "$mainMod, right, movefocus, r"
              "$mainMod, up, movefocus, u"
              "$mainMod, down, movefocus, d"
              "ALT, Tab, movefocus, d"

              # Move focus with mainMod + HJKL keys
              "$mainMod, h, movefocus, l"
              "$mainMod, l, movefocus, r"
              "$mainMod, k, movefocus, u"
              "$mainMod, j, movefocus, d"

              # Move active window to a relative workspace with mainMod + CTRL + ALT + [←→]
              "$mainMod CTRL ALT, right, movetoworkspace, r+1"
              "$mainMod CTRL ALT, left, movetoworkspace, r-1"

              # Move active window around current workspace with mainMod + SHIFT + CTRL [←→↑↓]
              "$mainMod SHIFT $CONTROL, left, movewindow, l"
              "$mainMod SHIFT $CONTROL, right, movewindow, r"
              "$mainMod SHIFT $CONTROL, up, movewindow, u"
              "$mainMod SHIFT $CONTROL, down, movewindow, d"

              # Move active window around current workspace with mainMod + SHIFT + CTRL [HLJK]
              "$mainMod SHIFT $CONTROL, H, movewindow, l"
              "$mainMod SHIFT $CONTROL, L, movewindow, r"
              "$mainMod SHIFT $CONTROL, K, movewindow, u"
              "$mainMod SHIFT $CONTROL, J, movewindow, d"

              # Special workspaces (scratchpad)
              "$mainMod ALT, S, movetoworkspacesilent, special"
              "$mainMod, S, togglespecialworkspace,"

              # move focus to workspace
              "$mainMod SHIFT,AMPERSAND,movetoworkspace,1"
              "$mainMod SHIFT,EACUTE,movetoworkspace,2"
              "$mainMod SHIFT,QUOTEDBL,movetoworkspace,3"
              "$mainMod SHIFT,APOSTROPHE,movetoworkspace,4"
              "$mainMod SHIFT,PARENLEFT,movetoworkspace,5"
              "$mainMod SHIFT,MINUS,movetoworkspace,6"
              "$mainMod SHIFT,EGRAVE,movetoworkspace,7"
              "$mainMod SHIFT,UNDERSCORE,movetoworkspace,8"
              "$mainMod SHIFT,CCEDILLA,movetoworkspace,9"
              "$mainMod SHIFT,AGRAVE,movetoworkspace,10"

              ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
              ",XF86AudioPlay, exec, playerctl play-pause"
              ",XF86AudioPause, exec, playerctl play-pause"
              ",XF86AudioNext, exec, playerctl next"
              ",XF86AudioPrev, exec, playerctl previous"

              # change wallpaper
              "$mainMod, H, exec, $hyprScriptsDir/change-wallpaper.sh"
            ];

            binde = [
              ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
              ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
              ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
              ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
            ];

            bindm = [
              # Move/Resize windows with mainMod + LMB/RMB and dragging
              "$mainMod, mouse:272, movewindow"
              "$mainMod, mouse:273, resizewindow"
            ];
          };
          extraConfig = ''

            monitor=,preferred,auto,1
            monitor=eDP-1,2880x1620@120.00200,0x0,1.5,bitdepth,10

            binds {
              workspace_back_and_forth = 1
            }

            workspace=1,monitor:eDP-1,default:true

          '';
        };
      })
    ];
}
