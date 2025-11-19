hostname := `hostname`
nh_flags := ""
nix_flags := ""
    
default:
    @just --list

[doc('rebuild the host
    pass extra nh and nix flags
    by setting "nix_flags" and "nh_flags"')]
switch HOST=hostname:
    nh os switch {{"-a --hostname " + HOST + " " + nh_flags}} -- {{"--accept-flake-config " + nix_flags}}

build-vm HOST=hostname:
    nh os build-vm {{"-a --hostname " + HOST + " " + nh_flags}} -- {{"--accept-flake-config " + nix_flags}}

build HOST=hostname:
    nh os build {{"--hostname " + HOST + " " + nh_flags}} -- {{"--accept-flake-config " + nix_flags}}
    
# update inputs
up +INPUTS="":
    nix flake update {{INPUTS}} --commit-lock-file

# open nix repl with configuration
repl HOST=hostname:
    nh os repl --hostname {{HOST}}
