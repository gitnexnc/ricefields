{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    jujutsu
    lazyjj
  ];

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "nexnc";
        email = "git@nexnc.com";
      };
      ui = {
        editor = "nvim";
        # Setting pager to "less -FRX" or an empty string "" 
        # ensures jj uses its own internal color/diff engine 
        # instead of passing it to Delta.
        pager = "less -FRX"; 
        
        diff.format = "color-words"; 
        
        signing-key = "0xDC9F9D4EAA4F9406";
      };
      git = {
        colocate = true;
      };
    };
  };
}
