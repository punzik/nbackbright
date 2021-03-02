Simple tool for backlight brightness control. For build from source needs
[Nim](https://nim-lang.org/) language compiler.

In NixOS download file `nbackbright.nix` and run `nix-env -f nbackbright.nix -i`.

Usage: `nbackbright <percent>`, where `<percent>` is a percentage of brightness
changing.

For example: `nbackbright -10` decrease brightness by 10%.
