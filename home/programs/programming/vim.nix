{ pkgs, ... }:

{
  programs.vim = {
    defaultEditor = true;
    settings.relativenumber = true;
  };
}