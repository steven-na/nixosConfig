{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    # rust
    go
    nodejs_23
    zig
    lua
    luajitPackages.jsregexp
    luajitPackages.luarocks_bootstrap
  ];
}
