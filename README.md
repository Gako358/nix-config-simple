# NixOS Configuration

This repository contains my personal NixOS configuration files.

## Overview

This is a modular NixOS and Home Manager configuration organized to support different hosts, services, and program configurations. The setup uses a full-disk encryption with LUKS and BTRFS subvolumes.

## Repository Structure

- `/hosts`: Machine-specific configurations
  - `/angreal`: Configuration for the "angreal" host (AMD-based system with LUKS encryption)
- `/modules`: User-specific configurations handled by Home Manager
  - `/cli`: Custom CLI tools and scripts
  - `/programs`: Application configurations
  - `/services`: User services
  - `/themes`: Visual theme settings
- `/overlay`: Custom package overlays
- `/pkgs`: Custom packages
- `/scripts`: Utility scripts for installation and setup
- `/system`: System-wide NixOS configurations
  - `/programs`: System-level application configurations
  - `/services`: System services

## Installation

Run the installation script:

```bash
./install.sh
```

Or manually set up the filesystem and install:

```bash
./scripts/setup_filesystem.sh
./scripts/homeInstall.sh
```

## Features

- Full disk encryption with LUKS
- BTRFS filesystem with subvolumes
- Firefox with custom settings
- Various CLI utilities
- Custom packages
