{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    # enableSensible = true;
    # enableVim = true;
    # extraConfig = ''
    # '';

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.catppuccin
    ];

    extraConfig = ''
      # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      # Mouse works as expected
      set-option -g mouse on
    '';
  };
}
