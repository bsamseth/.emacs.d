;;;
;;; This file is for configuration of Org-Mode
;;;
(add-to-list 'load-path (expand-file-name "~/.emacs.d/git/org-mode/lisp"))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)
;;
;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;; org-agenda-files variable that decides what is included in the agenda
(setq org-agenda-files (quote ("~/org")))
