# Emacs configuration
This repository contains a full Emacs configuration. The aim is that
everything needed to get it working is to clone this
repository. This is tested to some extent, but any dependencies
might need to be resolved. Also note that many of these files are not
required in order to have a fully functional configuration.

## Structure
The structure of this configuration is as follows:

1. The main file to look at is [init.el](init.el). This is the file
   loaded when Emacs starts. In this file all the required
   configuration is loaded from separate files.
2. Specific configuration is placed in a suitable file in [elisp](elisp/).
  * [modes.el](elisp/modes.el) for things related to specific modes
  * [keys.el](elisp/keys.el) for key bindings (not specific to a mode)
  * [preferences.el](elisp/preferences.el), misc. configuration.

If some parts of the whole configuration is not wanted, this way of
separating things makes it a bit easier to manage.
This structure is followed to some extent. 

## Installation
Installation should be as easy as cloning the repository and running the [install script](install.sh):
```
$ cd ~ && git clone https://github.com/bsamseth/.emacs.d
$ cd .emacs && ./install.sh
```
Note that this might take some time as it need to also download third-party repositories (see [.gitmodule](.gitmodule)).

Note also that all configuration related to org-mode will not be loaded. For this to happen you will need to
add/change certain paths in the [elisp/orgmode_config.el](org-mode configuration). Then the line
```
(load-library "orgmode_config")
```
may be left uncommented in order to load the configuration.


### Versions
The master branch should contain a version compatible with the newest
Emacs. Currently this means Emacs 24.5.1. If you use a different
version, you may checkout a different branch as older versions will be
listed there (not a complete list). Note that these versions will not
be maintained and may not include major parts of the current version.
