#{ config, pkgs, ... }:
#{
#  home.username = "ethang";
#  home.homeDirectory = "/home/ethang";
#
#  home.stateVersion = "25.11"; # Please read the comment before changing.
#  
#  nixpkgs.config.allowUnfree = true;
#  home.packages = with pkgs; [
#    cargo
#    rustc
#    rust-analyzer
#    gcc
#    pkg-config
#    openssl
#    tmux
#    uv
#    deno
#    google-chrome
#    opencode
#    ripgrep
#    unzip
#    bat
#    eza
#    fd
#    fzf
#    gh
#    htop
#    jq
#    tree
#    claude-code
#    codex
#    nodejs
#    ghostty
#  ];
#
#
#  # Home Manager is pretty good at managing dotfiles. The primary way to manage
#  # plain files is through 'home.file'.
#  home.file = {
#    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
#    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
#    # # symlink to the Nix store copy.
#    # ".screenrc".source = dotfiles/screenrc;
#
#    # # You can also set the file content immediately.
#    # ".gradle/gradle.properties".text = ''
#    #   org.gradle.console=verbose
#    #   org.gradle.daemon.idletimeout=3600000
#    # '';
#  };
#
#  # Home Manager can also manage your environment variables through
#  # 'home.sessionVariables'. These will be explicitly sourced when using a
#  # shell provided by Home Manager. If you don't want to manage your shell
#  # through Home Manager then you have to manually source 'hm-session-vars.sh'
#  # located at either
#  #
#  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#  #
#  # or
#  #
#  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#  #
#  # or
#  #
#  #  /etc/profiles/per-user/ethang/etc/profile.d/hm-session-vars.sh
#  #
#  home.sessionVariables = {
#    TERMINAL = "ghostty";
#    # EDITOR = "emacs";
#  };
#
#  # Let Home Manager install and manage itself.
#  programs.home-manager.enable = true;
#  programs.neovim = {
#    enable = true;
#    defaultEditor = true;
#    viAlias = true;
#    vimAlias = true;
#    plugins = [
#      pkgs.vimPlugins.nvim-treesitter
#      pkgs.vimPlugins.nvim-lspconfig
#      pkgs.vimPlugins.nvim-web-devicons
#      pkgs.vimPlugins.mason-nvim
#      pkgs.vimPlugins.mason-lspconfig-nvim
#    ];
#  };
#  programs.git = {
#    enable = true;
#    settings = {
#      user = {
#        name  = "emgardner";
#        email= "gardner.ethan10@gmail.com";
#      };
#    };
#  };
#  programs.ssh.enable = true;
#
#  programs.zsh = {
#    enable = true;
#    enableCompletion = true;
#    autosuggestion.enable = true;
#    syntaxHighlighting.enable = true;
#    history.size = 10000;
#    oh-my-zsh = {
#      enable = true;
#      plugins = [ "git" "thefuck" ];
#      theme = "robbyrussell";
#    };
#    shellAliases = {
#      ll = "eza -l";
#      la = "eza -la";
#      cat = "bat";
#      grep = "rg";
#      find = "fd";
#      update = "sudo nixos-rebuild switch";
#      hms = "home-manager switch";
#      g = "git";
#      gs = "git status";
#      gc = "git commit";
#      gp = "git push";
#      cdp = "cd ~/projects";
#      eh = "nvim ~/.config/home-manager/home.nix";
#      es = "sudo nvim /etc/nixos/configuration.nix";
#    };
#    initContent = ''
#      alias ll="eza -l"
#      alias la="eza -la"
#      alias cat="bat"
#      alias grep="rg"
#      alias find="fd"
#      alias update="sudo nixos-rebuild switch"
#      alias hms="home-manager switch"
#      alias g="git"
#      alias gs="git status"
#      alias gc="git commit"
#      alias gp="git push"
#      alias cdp="cd ~/projects"
#      alias eh="nvim ~/.config/home-manager/home.nix"
#      alias es="sudo nvim /etc/nixos/configuration.nix"
#    '';
#  };
#
#  dconf.settings = {
#    "org/gnome/settings-daemon/plugins/media-keys" = {
#      custom-keybindings = [
#        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
#      ];
#    };
#
#    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
#      name = "Open Ghostty";
#      command = "ghostty";
#      binding = "<Control><Alt>t";
#    };
#  };
#}


{ config, pkgs, ... }:

{
  home.username = "ethang";
  home.homeDirectory = "/home/ethang";
  home.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/packages.nix
    ./modules/zsh.nix
    ./modules/neovim.nix
    ./modules/git.nix
    ./modules/gnome.nix
  ];

  programs.home-manager.enable = true;

  home.sessionVariables = {
    TERMINAL = "ghostty";
  };
}
