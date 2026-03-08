{ ... }:

{
  home.file.".config/zed/settings.json".text = builtins.toJSON {
    autosave = "on_focus_change";
    auto_install_extensions = {
      dockerfile = true;
      html = true;
      log = true;
      make = true;
      sql = true;
      toml = true;
    };

    git_panel = {
      tree_view = true;
    };

    vim = {
      cursor_shape = {
        normal = "hollow";
        insert = "bar";
        replace = "block";
        visual = "underline";
      };
      toggle_relative_line_numbers = true;
      use_system_clipboard = "on_yank";
    };

    minimap = {
      show = "never";
    };

    telemetry = {
      metrics = false;
    };

    terminal = {
      dock = "right";
    };

    vim_mode = true;
    ui_font_size = 16;
    buffer_font_family = "Iosevka Term";
    buffer_font_size = 16.0;
    show_whitespaces = "all";
    wrap_guides = [ 80 ];

    theme = {
      mode = "system";
      light = "One Light";
      dark = "One Dark";
    };
  };
}
