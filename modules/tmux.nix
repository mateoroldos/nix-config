{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    # enableSensible = true;
    # enableVim = true;

    terminal = "kitty";

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set-option -g status-position top
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"

          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_status_modules_right ""
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator ""
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"

          set -g @catppuccin_directory_text "#{pane_current_path}"
          set -g @catppuccin_status_background "default"
          set-option -g default-terminal "screen-256color"
        '';
      }
    ];

    extraConfig = ''
      # Mouse works as expecte
      set-option -g mouse on
    '';
  };
}
