{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    
    # This automatically adds your key to the agent when you first use it
    addKeysToAgent = "yes"; 
  };

  services.ssh-agent = {
    enable = true;
  };
}
