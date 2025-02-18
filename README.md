# Manual setup

## Symbolic link

```bash
$ ln -s /path/to/dotfiles/_vimrc ~/.vimrc
$ ln -s /path/to/dotfiles/_zshrc ~/.zshrc
$ ln -s /path/to/dotfiles/_zprofile ~/.zprofile
```

## Destop application

- https://www.docker.com/products/docker-desktop/

## Haskell

```
$ curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

Welcome to Haskell!

This script can download and install the following binaries:

- ghcup - The Haskell toolchain installer
- ghc - The Glasgow Haskell Compiler
- cabal - The Cabal build tool for managing Haskell software
- stack - A cross-platform program for developing Haskell projects (similar to cabal)
- hls - (optional) A language server for developers to integrate with their editor/IDE

ghcup installs only into the following directory,
which can be removed anytime:
/Users/sakaeshinya/.ghcup

Press ENTER to proceed or ctrl-c to abort.
Note that this script can be re-run at any given time.

---

Detected zsh shell on your system...
Do you want ghcup to automatically add the required PATH variable to "/Users/sakaeshinya/.zshrc"?

[P] Yes, prepend [A] Yes, append [N] No [?] Help (default is "P").

## N

Do you want to install haskell-language-server (HLS)?
HLS is a language-server that provides IDE-like functionality
and can integrate with different editors, such as Vim, Emacs, VS Code, Atom, ...
Also see https://haskell-language-server.readthedocs.io/en/stable/

[Y] Yes [N] No [?] Help (default is "N").

## Y

Do you want to enable better integration of stack with GHCup?
This means that stack won't install its own GHC versions, but uses GHCup's.
For more information see:
https://docs.haskellstack.org/en/stable/yaml_configuration/#ghc-installation-customisation-experimental
If you want to keep stacks vanilla behavior, answer 'No'.

[Y] Yes [N] No [?] Help (default is "Y").

Y
sh: line 138: /Users/sakaeshinya/.ghcup/bin/ghcup: No such file or directory
"ghcup --metadata-fetching-mode=Strict upgrade" failed!

<snip>
```
