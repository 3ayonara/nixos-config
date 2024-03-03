{ config, pkgs, ... }:

{
  home.username = "ian";
  home.homeDirectory = "/home/ian";

  home.packages = with pkgs;[
    neofetch
    btop
    rofi
    kitty
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
