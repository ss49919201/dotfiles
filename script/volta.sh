#!/bin/bash

set -e

volta setup
volta install node
volta install pnpm

exec zsh

node -v
