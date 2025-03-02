{
  inputs,
  pkgs,
  lib,
  ...
}:
with lib; {
  # Core pakages for system
  environment.systemPackages = with pkgs; [
    wget
    curl
    git

    nodejs-18_x # Github Copilot requires nodejs 16
    alejandra # Nix formatting tool
    inputs.nvimFlake.defaultPackage.${pkgs.system} # Neovim
  ];

  imports = [
    ./desktop.nix
    ./fonts.nix
    ./gaming.nix
    ./shell.nix
  ];
}
