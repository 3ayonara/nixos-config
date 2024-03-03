{ config, pkgs, ... }:

{
  home.username = "ian";
  home.homeDirectory = "/home/ian";

  home.packages = with pkgs;[
    neofetch
    btop
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
