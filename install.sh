#!/usr/bin/env bash

set -ex
flake="angreal"

# Setup filesystem
source ./scripts/setup_filesystem.sh

# Install Nix
nixos-install --flake .#$flake
