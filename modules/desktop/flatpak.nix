{ pkgs, user, ... }:

# Reference: https://nixos.wiki/wiki/Flatpak
{
  services.flatpak.enable = true;

  users = {
    users.ian = {
      packages = with pkgs; [ flatpak ];
    };
  };
}