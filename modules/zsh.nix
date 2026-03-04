{ lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };

    # Run late; override OMZ/plugin aliases
    initContent = lib.mkOrder 1500 ''
      unalias ll 2>/dev/null
      unalias la 2>/dev/null

      alias ll="eza -l"
      alias la="eza -la"
      alias cat="bat"
      alias grep="rg"
      alias find="fd"
      alias update="sudo nixos-rebuild switch"
      alias hms="home-manager switch"
      alias g="git"
      alias gs="git status"
      alias gc="git commit"
      alias gp="git push"
      alias cdp="cd ~/projects"
      alias eh="nvim ~/.config/home-manager/home.nix"
      alias es="sudo nvim /etc/nixos/configuration.nix"
    '';
  };
}
