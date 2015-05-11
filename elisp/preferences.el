;; This file is for preferences that will apply regardles of mode.

(defalias 'yes-or-no-p 'y-or-n-p) ;; y bother indead

;; line numbers
(global-linum-mode 1)
(setq linum-format "%d ")



;; Don't show start up message on launch
(setq inhibit-startup-message t inhibit-startup-echo-area-message t)
(setq initial-scratch-message "")


;; supercharge completion and stuff. Super fuzzy completion --> tii in .emacs.d/ gives init.el !
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;; to enable vertical mode, this has to be done after init
(add-hook 'after-init-hook 'ido-vertical-mode)

;; double ensure that ido is everywhere, and wit flex
(require 'ido-better-flex)
(require 'ido-ubiquitous)
(ido-better-flex/enable)
(ido-ubiquitous-mode 1)

;; Smex
(autoload 'smex "smex"
   "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")
(define-key my-mode-map (kbd "M-x") 'smex)

(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; navigate camelCaseWords as seperate words
(global-subword-mode 1)
