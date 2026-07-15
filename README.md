# wfinfo-ng Nix package

A Nix package for [WFInfo-ng](https://github.com/knoellle/wfinfo-ng), a Linux alternative of the Warframe relic utility [WFInfo](https://wfinfo.warframestat.us/).  
Detects relic reward screens and displays platinum values for each option, see the [WFInfo-ng](https://github.com/knoellle/wfinfo-ng) repo for more info.

## Using

It can be run directly with `nix run github:OffsetMonkey538/wfinfo-ng-nix`.

If you want to be able to just call the `wfinfo` binary from anywhere, you can, add this repository as an input of your `flake.nix`:

```nix
{
  inputs = {
    wfinfo-ng.url = "github:OffsetMonkey538/wfinfo-ng-nix";
  };
}
```

and then add the package:
```nix
environment.systemPackages = [
  wfinfo-ng.packages.${stdenv.hostPlatform.system}.default
];

# Or with home manager
home.packages = [
  wfinfo-ng.packages.${stdenv.hostPlatform.system}.default
];
```

Now the `wfinfo` command should be available on your system.
