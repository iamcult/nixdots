{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./modules/hardware-configuration.nix
      ./modules/optinstate.nix
      ./modules/mountoptions.nix
      ./modules/configuration.nix
    ];

  networking.hostName = "snowball";
}
