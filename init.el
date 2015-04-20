;; This is the main init file. This file should not contain more than 
;; load calls to separate files.

(setq inhibit-default-init t)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; (add-to-list 'load-path "~/.emacs.d/")
;; (add-to-list 'load-path "~/.emacs.d/elisp/")

(load-library "keys")
(load-library "orgmode_config")
(load-library "modes")
(load-library "preferences")

;;Things added by changing things through customize
(setq custom-file "~/.emacs.d/elisp/emacs-custom.el")
(load custom-file)

;; activate melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


