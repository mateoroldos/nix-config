_: {
  programs.git = {
    enable = true;
    userName = "Mateo Roldos";
    userEmail = "mateoroldos19@gmail.com";

    delta = {
      enable = true;
      options = {
        syntax-theme = "TwoDark";
        side-by-side = true;
      };
    };

    extraConfig = {
      github = {
        user = "mateoroldos";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = false;
      };
      push = {
        autoSetupRemote = true;
      };
      core = {
        editor = "nvim";
        fileMode = false;
        ignorecase = false;
      };
    };
  };
}
