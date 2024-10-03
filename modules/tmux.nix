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
  };
}
