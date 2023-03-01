## nixpkgs
Personal nixpkgs repository

## Packages
| Name | Description | Platforms |
|------|-------------|-----------|
| [hblock](https://github.com/hectorm/hblock) | A POSIX-compliant shell script for blocking ads, malware and tracking domains | x86_64-linux |

## Usage
```bash
# build example
# either clone the repository and build or:
nix-build https://github.com/sogreatandpowerfull/nixpkgs/archive/experimental.tar.gz -A hblock
```

Using it in your `configuration.nix`:
```nix
{pkgs, ...}: {
  nixpkgs.config.packageOverrides = pkgs: {
    sogreatandpowerful = import (builtins.fetchTarball "https://github.com/sogreatandpowerfull/nixpkgs/archive/experimental.tar.gz") {
      inherit pkgs;
    };
  };

  environment.systemPackages = with pkgs; [
    sogreatandpowerful.hblock
  ];
}
```