_: {
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_night";
  };
  xdg.configFile."kitty/kitty.conf".text = ''
    shell_integration zsh
    font_family MesloLGS Nerd Font
    macos_option_as_alt yes
  '';
}
