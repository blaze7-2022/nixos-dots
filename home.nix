{ config, pkgs, ... }:

{
  home.username = "ishaanpahuja";
  home.homeDirectory = "/home/ishaanpahuja";
  programs.fish = {
    enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      config-nix = "sudo nvim /etc/nixos/configuration.nix";
      home-nix = "sudo nvim /etc/nixos/home.nix";
      flakes-config = "sudo nvim /etc/nixos/flake.nix";
      nix-emerge = "cd /etc/nixos; sudo nix flake update; sudo nixos-rebuild switch";
    };

    interactiveShellInit = ''
    set fish_greeting
    starship init fish | source
    fish_config theme choose "Rosé-Pine"
    '';
  };

  home.packages = with pkgs; [
    bat
    tree
    nwg-look
    starship
    cava
    btop
  ];

  programs.bat = {
    enable = true;

    config = {
      paging = "auto";
      style = "numbers,changes,grid";
      theme = "Rose-Pine";
    };
  };

  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;

      preload = [
        "/home/ishaanpahuja/Downloads/wallpaper-theme-converter.png"
      ];

      wallpaper = [
        {
          monitor = "eDP-1";
          path = "/home/ishaanpahuja/Downloads/wallpaper-theme-converter.png";
        }
      ];
    };
  };

  services.hypridle = {
  enable = true;

  settings = {
    general = {
      lock_cmd = "pidof hyprlock || hyprlock";
      before_sleep_cmd = "loginctl lock-session";
      after_sleep_cmd = "hyprctl dispatch dpms on";
    };

    listener = [
      {
        timeout = 180;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on";
      }
      {
        timeout = 300;
        on-timeout = "loginctl lock-session";
      }
      {
        timeout = 380;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on";
      }
      {
        timeout = 600;
        on-timeout = "systemctl suspend";
       }
     ];
   };
 };

  programs.cava = {
    enable = true;
    settings = {
      color = {
        gradient = 1;
        gradient_color_1 = "'#94e2d5'";
        gradient_color_2 = "'#89dceb'";
	gradient_color_3 = "'#74c7ec'";
	gradient_color_4 = "'#89b4fa'";
	gradient_color_5 = "'#cba6f7'";
	gradient_color_6 = "'#f5c2e7'";
	gradient_color_7 = "'#eba0ac'";
	gradient_color_8 = "'#f38ba8'";
      };
    };
  };

  home.stateVersion = "26.11";
}

