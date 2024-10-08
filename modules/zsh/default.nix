{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    dotDir = ".config/zsh"; # Already prepends $HOME

    plugins = with pkgs; [
    ];

    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
    shellAliases = {
      ls = "eza --oneline";
      lsa = "eza --all --oneline";
      lsl = "eza --long --header --total-size --time-style=long-iso";
      lsal = "eza --all --long --header --total-size --time-style=long-iso";
      lss = "eza --long --sort=size";
      lsd = "eza --only-dirs --oneline";
      lsf = "eza --only-files --oneline";
      lsab = "eza --absolute=on --oneline";
      gdmb = "git branch --merged | grep -Ev '(^\\*|main)' | xargs git branch -d";
      gbsc = "git branch --sort=-committerdate";
      reload = "source ~/.config/zsh/.zshrc";
      zed = "open -a /Applications/Zed.app -n";
      fnvim = "nvim $(fzf -m --preview='bat --color=always {}')";
      fzfb = "fzf --preview='bat --color=always {}'";
    };

    initExtraBeforeCompInit = ''
    '';

    initExtra = ''
      lst() {
        if [[ -n $1 ]]; then
          eza -R --level="$1" --tree
        else
          eza -R --tree
        fi
      }

      eval "$(zoxide init zsh)"
    '';

    history = {
      # Expire duplicates first
      expireDuplicatesFirst = false;
      # Save timestamp into the history file
      extended = true;
      # If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event)
      ignoreAllDups = false;
      # Do not enter command lines into the history list if they are duplicates of the previous event
      ignoreDups = false;
      # Do not enter command lines into the history list if they match any one of the given shell patterns
      ignorePatterns = [];
      # Do not enter command lines into the history list if the first character is a space
      ignoreSpace = false;
      # History file location	string
      path = "/Users/mateoroldos/.zsh_history";
      # Number of history lines to save
      save = 50000;
      # Number of history lines to keep
      size = 10000;
      # Share command history between zsh sessions
      share = true;
    };
  };
}
