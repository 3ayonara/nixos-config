{ inputs, pkgs, user, ... }:

{
  users = {
    users.ian = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
    };

    users.root = {
      shell = pkgs.bash;
    };

  };
}