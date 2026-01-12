{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    
    # Optional: Set your preferred settings
    shortcut = "a";  # Changes prefix to Ctrl-a (default is b)
    baseIndex = 1;   # Start window numbering at 1
    terminal = "screen-256color";
    
    # Enable mouse support
    mouse = true;
    
    # Key bindings and other settings
    extraConfig = ''
      # Reload config
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
      
      # Split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %
      
      # Enable vi mode
      set-window-option -g mode-keys vi
      
      # Continuum settings
      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '15'
      
      # Optional: Show continuum status in status bar
      set -g status-right 'Continuum: #{continuum_status}'
      
      # Optional: Resurrect additional settings
      set -g @resurrect-capture-pane-contents 'on'
      set -g @resurrect-strategy-vim 'session'
    '';
    
    # Plugins
    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
      continuum
      yank
    ];
  };
}
