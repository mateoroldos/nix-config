{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
    ./zsh
    ./tmux.nix
    ./starship.nix
    ./kitty.nix
  ];

  home = {
    stateVersion = "22.11";
    sessionVariables = {
      PAGER = "less";
      CLICOLOR = 1;
      EDITOR = "nvim";
      VISUAL = "nvim";
      ENV = "/Users/mateoroldos/.config/zsh/.zshrc";
      NPM_CONFIG_PREFIX = "~/.npm-global";
    };

    packages = with pkgs; [
      # nvim
      configured-nvim
      configured-nvim-deps

      # FROM NIXPKGS
      ripgrep
      curl
      less
      git
      nodejs_22
      wifi-password
      zoxide
      lazygit
      nodePackages.prettier
      degit
      karabiner-elements
      just
      turso-cli
      pnpm
    ];
  };

  programs = {
    eza = {
      enable = true;
      enableZshIntegration = true;
      icons = true;
      git = true;
    };
    bat = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
  };
}
