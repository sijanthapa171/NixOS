{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    plugins = with pkgs; [
      tmuxPlugins.gruvbox
      tmuxPlugins.vim-tmux-navigator
    ];
    extraConfig = ''
      set -g default-terminal "tmux-256color"
      set -s escape-time 0

      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix
      set -g status-style 'bg=#333333 fg=#5eacd3'
      set -g base-index 1

      setw -g mode-keys vi
      set-window-option -g mode-keys vi
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

      # vim-like pane switching
      bind -r ^ last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R

      bind -r D neww -c "#{pane_current_path}" "[[ -e README.md ]] && nvim README.md || nvim ~/personal/todo.md"

      # forget the find window.  That is for chumps
      bind-key -r f run-shell "tmux neww tmux-sessionizer"
      bind-key -r g run-shell "tmux neww git-sessionizer"

    '';
  };
}
