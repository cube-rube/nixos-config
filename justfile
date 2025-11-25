export NH_FLAKE := "."

hostname := `hostname`
nh_args := ""
nix_args := ""
    
default:
    @just --list

[doc('rebuild the host
    pass extra nh and nix flags
    by setting "nix_args" and "nh_args" vars')]
switch HOST=hostname:
    nh os switch {{"-a --hostname " + HOST + " " + nh_args}} -- {{"--accept-flake-config " + nix_args}}

build-vm HOST=hostname:
    nh os build-vm {{"--hostname " + HOST + " " + nh_args}} -- {{"--accept-flake-config " + nix_args}}

run-vm HOST: (build-vm HOST)
    ./result/bin/run-{{HOST}}-vm

build HOST=hostname:
    nh os build {{"--hostname " + HOST + " " + nh_args}} -- {{"--accept-flake-config " + nix_args}}
    
# update inputs
up +INPUTS="":
    nix flake update {{INPUTS}} --commit-lock-file

# open nix repl with configuration
repl HOST=hostname:
    nh os repl --hostname {{HOST}} {{nh_args}}
