hostname := `hostname`
extra_nh := ""
nh_flags := "-a " + extra_nh
extra_nix := ""
nix_flags := "--accept-flake-config " + extra_nix
    
default:
    @just --list

[doc('rebuild the host
    pass extra nix and nh args
    by setting "extra_nh" and "extra_nix"')]
rebuild HOST=hostname:
    nh os switch {{nh_flags + " --hostname " + HOST}} -- --accept-flake-config

# update inputs
up +INPUTS="":
    nix flake update {{INPUTS}} --commit-lock-file

# open nix repl with configuration
repl HOST=hostname:
    nh os repl --hostname {{HOST}}
