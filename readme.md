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
# executable available in ./result/bin/hblock
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
N.B: Using `builtins.fetchTarball` without a sha256 will only cache the download for 1 hour by default, so you need internet access almost every time you build something. You can pin the version if you don't want that:
```nix
builtins.fetchTarball {
  # Get the revision by choosing a version from https://github.com/sogreatandpowerfull/nixpkgs/commits/experimental
  url = "https://github.com/sogreatandpowerfull/nixpkgs/archive/<revision>.tar.gz";
  # Get the hash by running `nix-prefetch-url --unpack <url>` on the above url
  sha256 = "<revision-sha256>";
}
```

## Note
`hblock` requires root permission to work, so you need to use `sudo` or `doas`. As `hblock` modifies the hosts file (`/etc/hosts`), you'll also need to add the following to your `configuration.nix`:
```nix
# Required for hblock
environment.etc.hosts.mode = "0644";
```
