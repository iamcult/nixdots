{ config, lib, pkgs, ... }:

{
  filesystems = {
    "/".options = [ "subvol=root" "compress=zstd" ];
    "/home".options = [ "subvol=home" "compress=zstd" ];
    "/nix".options = [ "subvol=nix" "compress=zstd" "noatime" ];
    "/persist".options = [ "subvol=persist" "compress=zstd" ];
    "/etc/nixos".options = [ "subvol=nixosconfig" "compress=zstd" ];
    "/var/log".options = [ "subvol=log" "compress=zstd" ];
  };
}
