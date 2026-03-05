{
  programs.starship = {
    enable = true;

    settings = {
      format = ''$all$directory[\$](bold blue) '';
      add_newline = false;

      character = {
        success_symbol = "[•](bold green)";
        error_symbol = "[•](bold red)";
      };
    };
  };
}
