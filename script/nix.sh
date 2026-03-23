#!/bin/bash

set -e

curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install
