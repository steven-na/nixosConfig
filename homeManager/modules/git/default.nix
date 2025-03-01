{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Blake C";
    userEmail = "bstevencamp@gmail.com";
  };
}
