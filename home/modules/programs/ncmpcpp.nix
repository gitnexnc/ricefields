{ config, pkgs, ... }:

{
 programs.ncmpcpp = {
    enable = true;
    
    settings = {
      ncmpcpp_directory = "~/.config/ncmpcpp";
      lyrics_directory = "~/.lyrics";
      mpd_host = "127.0.0.1";
      mpd_port = 6600;
      mouse_support = "no";
      user_interface = "alternative";
      playlist_display_mode = "columns";
      browser_display_mode = "columns";
      search_engine_display_mode = "columns";
      progressbar_look = "=>-";
      progressbar_color = "cyan";
      progressbar_elapsed_color = "white";
      colors_enabled = "yes";
      main_window_color = "white";
      statusbar_color = "cyan";
      song_list_format = "{%a - }{%t}|{$8%f$9}$R{$3(%l)$9}";
      song_status_format = "{{%a{ \"%b\"{ (%y)}} - }{%t}}|{%f}";
      now_playing_prefix = "$b$5»$7»$1» ";
      now_playing_suffix = "$/b";
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "Visualizer";
      visualizer_in_stereo = "yes";
      visualizer_type = "wave";
      visualizer_look = "●▮";
      visualizer_color = "cyan, green, yellow, magenta, red";
      display_bitrate = "yes";
      autocenter_mode = "yes";
      centered_cursor = "yes";
      follow_now_playing_lyrics = "yes";
      fetch_lyrics_for_current_song_in_background = "yes";
    };
    
    bindings = [
      { key = "j"; command = "scroll_down"; }
      { key = "k"; command = "scroll_up"; }
      { key = "h"; command = "previous_column"; }
      { key = "l"; command = "next_column"; }
      { key = "ctrl-u"; command = "page_up"; }
      { key = "ctrl-d"; command = "page_down"; }
      { key = "g"; command = "move_home"; }
      { key = "G"; command = "move_end"; }
      { key = "n"; command = "next_found_item"; }
      { key = "N"; command = "previous_found_item"; }
    ];
  };
}
