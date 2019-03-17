# Install

Requires: ``stow``.

## Usage

Each top-level directory in this repository represents a package ``$PACKAGE``
managed by ``stow``. The target directory for stow is ``${HOME}``

```bash
stow -t ${HOME} ${PACKAGE}
```

This installs a bunch of symlinks pointing to the files in this directory, thus enabling the given configuration.

## Hosts

* ivy: ``./ivy.sh``
* 2b: ``./2b.sh``
