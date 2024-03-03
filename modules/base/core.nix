{ lib, pkgs, ... }: 

{
  ###################################################################################
  #
  #  NixOS's core configuration suitable for all my machines
  #
  ###################################################################################

  # to install chrome, you need to enable unfree packages
  nixpkgs.config.allowUnfree = lib.mkForce true;

  boot.loader.systemd-boot = {
    # we use Git for version control, so we don't need to keep too many generations.
    configurationLimit = lib.mkDefault 10;
    # pick the highest resolution for systemd-boot's console.
    consoleMode = lib.mkDefault "max";
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

  services = {
    # openssh daemon
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false; # disable SSH password log in
    };
  };
  
}