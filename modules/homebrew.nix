_: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    caskArgs.no_quarantine = true;
    global.brewfile = true;

    masApps = {};
    casks = [
      "kitty"
    ];
    taps = [];
    # CHECK NIX FIRST!
    brews = [];
  };
}
