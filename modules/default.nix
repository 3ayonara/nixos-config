{ pkgs, lib, system, ...}:

{

  environment.systemPackages = with pkgs; [
    git
    git-lfs

    # archives
    zip
    unzip
    xz

    # networking tools
    wget
    curl
    nmap

    # misc
    jq
    file
    findutils
    which
    tree
    gnutar
    rsync
  ];

  system = {
    stateVersion = "24.05";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
  };

  nix = {
    # enable flake
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    settings = {
      # enable auto-cleanup
      auto-optimise-store = true;
      # set max-jobs
      max-jobs = lib.mkDefault 8;
    };

    # garbage collection
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete older-than 3d";
    };
  };

}