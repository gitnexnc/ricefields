{ config, pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
      };
      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/.ssh/git";
      };
      "github.com" = {
	hostname = "github.com";
	user = "git";
	identityFile = "~/.ssh/git";
      };
      "codeberg.org" = {
	hostname = "codeberg.org";
	user = "git";
	identityFile = "~/.ssh/git";
      };
    };
  };
  services.ssh-agent = {
    enable = true;
  };
}
