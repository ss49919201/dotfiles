#!/bin/bash
git config --global user.name "Shinya Sakae"
git config --global user.email "ss49919201@gmail.com"
git config pull.rebase false
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.line-numbers true
git config --global merge.conflictstyle "diff3"
git config --global diff.colorMoved "default"
git config --global init.defaultBranch main
