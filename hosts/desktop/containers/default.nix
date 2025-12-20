{ config, pkgs, ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";
    containers = 
      (import ./portainer.nix) //
      (import ./cloudflared.nix);
  };
}
