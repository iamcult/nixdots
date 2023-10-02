{ config, lib, pkgs, ... }:

{
  filesystems = {
    "/".options = [ "subvol=root" "compress=zstd" ];
    "/home".options = [ "subvol=root" "compress=zstd" ];
    "/nix".options = [ "subvol=root" "compress=zstd" "noatime" ];
    "/persist".options = [ "subvol=root" "compress=zstd" ];
    "/var/log".options = [ "subvol=root" "compress=zstd" ];
  };
}
