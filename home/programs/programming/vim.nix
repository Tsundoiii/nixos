{ pkgs, ... }:

{
  programs.vim = {
    defaultEditor = true;
    relativenumber = true;
  };
}