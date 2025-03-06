{ config, pkgs, ... }:

{
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  # input method fcitx 5
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-chinese-addons
        fcitx5-gtk
      ];
      waylandFrontend = true;
      #ignoreUserConfig = true;
      settings = {
        addons = {
          classicui.globalSection.Theme = "FluentDark-solid";
          pinyin.globalSection.FirstRun = "False";
        };
#         inputMethod = {
#           "Groups/0" = {
#             Name = "Default";
#             "Default Layout" = "us";
#             DefaultIM = "keyboard-us";
#           };
#           "Groups/0/Items/0" = {
#             Name = "keyboard-us";
#             Layout = "";
#           };
#           "Groups/0/Items/1" = {
#             Name = "pinyin";
#             Layout = "";
#           };
#         };
      };
    };
  };

  fonts.fontDir.enable = true;

  fonts = {
    packages = with pkgs; [
      fira-code-nerdfont
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      wqy_microhei
      wqy_zenhei
    jetbrains-mono
    noto-fonts
    font-awesome
    powerline-fonts
    powerline-symbols
  ];
    fontconfig = {
      antialias = true;
      hinting.enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji"];
        monospace = ["FiraCode Nerd Font"];
        sansSerif = [ "Noto Sans CJK SC"];
        serif = ["Noto Serif CJK SC"];
      };
    };
  };
}
