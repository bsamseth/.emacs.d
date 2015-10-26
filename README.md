# Emacs configuration
This repository contains a full Emacs configuration. The aim is that
everything needed to get this working is to clone this
repository. This is however not guarantied, and many dependencies
might need to be resolved. Also note that many of these files are not
required, but still included.

## Structure
The structure of this configuration is as follows:

1. The main file to look at is [init.el](init.el). This is the file
   loaded when Emacs starts. In this file all the required
   configuration is loaded from separate files.
2. Specific configuration is placed in a suitable file in [elisp](elisp/).
  * [modes.el](elisp/modes.el) for things related to specific modes
  * [keys.el](elisp/keys.el) for keybindings (not specific to a mode)
  * [preferences.el](elisp/preferences.el), misc. configuration.

If some parts of the whole configuration is not wanted, this way of
separating things makes it a bit easier to manage.
This structure is followed to some extent. 

## Installation
Installation should be as easy as cloning the repository:
```
$ cd ~ && git clone https://github.com/bsamseth/.emacs.d
```
Please not however that before you start Emacs you need to edit the
Org-mode configuration. This depends on certain folders to exist, and
will cause the load to fail if not handled. As a first, just ignore
the configuration related to Org-mode. This is done by commenting the
following line in [init.el](init.el) (showing how the line should look
*after* your change, with some context):
```
(load-library "keys")
;; (load-library "orgmode_config")
(load-library "modes")
(load-library "preferences")
```


### Versions
The master branch should contain a version compatible with the newest
Emacs. Currently this means Emacs 24.5.1. If you use a different
version, you may checkout a different branch as older versions will be
listed there (not a complete list).

