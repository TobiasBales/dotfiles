{ pkgs, ... }:

{
  users.users.tobias = {
    isNormalUser = true;
    home = "/home/tobias";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$yVHd9Ng40oMsvF5$GJNK40CETUqnDNpw13P6dXhuS2ocNQ.2W6vp91QY/wJ3dpPYElQH6sjs7eTwKTZenDGvfoIWREV8otAamUW9b.";
    openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCcFDgaC9IYbSu41UvlqT53OxdBQGBJyEP7LQCyiQ6661a+Ie5E+gluKx3w9bMjlS2J5VFu7W0cATIuT7BodcvWUD15sL8v/ocM5XWz31LUCtg+LLXpayoAeQyfO2Om2j5L7W9GG/7C7ixN5F6ixNcZHPdo/b7a+N3+SgFfRbbmryd7xJa1HyWDY2qJCcmWpHCXQ3mrv5OVl/D63jfPhDEsqZxIQOcebFvgdcHYi5b6xZFeAOix41duJv1GB16WMNP/kwjhlSvW336j8+v7oj3gxl1u5465fvnBMV5i/qY/pHsN2fFzNvR60MQTyvdscBt5XRNSaxdsqrGORFXrOv8s0GyfOoNngp53xhxVpvQ1mDWAUREEtOMehCqr4orWBpF264bvZ4UyWXsFAEXa//tDgw21eMfdNhkwND76e4+PNSev+hnywc8oaOtpcsd9hHQOskuMrZbUiIKerqIl24mh9eKhHUcgt9y1qeeAmcL9sfp9TjZ9/eWUEwWy65MqMzFdZI/ZqXFhQ53xWtdk4BrKDDGAIptqGb+CxGijaOZQcGExpwaRZGvRvXmNFq/kfCI+yALWoUuh28vFJy3OwGeymJOvFSY5OYKxawJHpch05K5lvN6sJWZVlvLJnkDAtcP63kLyf1pRtuKevZl2Tvo1E/0NgctwyJi69bRbLfyFEw=="
    "sk-ecdsa-sha2-nistp256@openssh.com AAAAInNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb20AAAAIbmlzdHAyNTYAAABBBNZTivo2jjpTGQpFLGUq/P8TwxhwuIV9CFT+qjqOwpIS8j0c0wdsJSzpAPEzeOr9a1pHx7TKq9SVboyNUm2+BA0AAAAEc3NoOg=="
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix)
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/1dd99a6c91b4a6909e66d0ee69b3f31995f38851.tar.gz;
      sha256 = "1z8gx1cqd18s8zgqksjbyinwgcbndg2r6wv59c4qs24rbgcsvny9";
    }))
  ];
}
