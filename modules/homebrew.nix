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
      "arc"
      "discord"
      "visual-studio-code"
      "zoom"
      "affinity-designer"
      "cleanmymac"
      "raycast"
      "obsidian"
      "docker"
      "karabiner-elements"
      "kitty"
    ];
    taps = [];
    # CHECK NIX FIRST!
    brews = [];
  };
}
