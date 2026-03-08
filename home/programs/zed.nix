{ ... }:

{
  home.file.".config/zed/settings.json".text = builtins.toJSON {
    vim = {
      toggle_relative_line_numbers = true;
    };

    minimap = {
      show = "never";
    };

    vim_mode = true;
    ui_font_size = 16;
    buffer_font_size = 15;

    theme = {
      mode = "system";
      light = "One Light";
      dark = "One Dark";
    };
  };
}
