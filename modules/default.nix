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

}