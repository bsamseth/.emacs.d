;; set themes, change from M-x customize-themes. New themes goes in the following folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-verbatim-environments (quote ("verbatim" "verbatim*" "comment")))
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (lush)))
 '(custom-safe-themes (quote ("1ba463f6ac329a56b38ae6ac8ca67c8684c060e9a6ba05584c90c4bffc8046c3" "1636c901ca6cedd80bea5d97b59238ee9467b712a2cf39c8bb1cd3a49cc6f0ba" "4cefd96dbec5c775b1b396989d695d6b1cd4961f6ad78595f4ef45d8805a88da" default)))
 '(flyspell-issue-message-flag nil)
 '(global-auto-revert-mode t)
 '(global-visible-mark-mode t)
 '(menu-bar-mode 1)
 '(org-clock-idle-time 15)
 '(org-clock-into-drawer 2)
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-mobile-inbox-for-pull "~/org/refile.org")
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 9))))
 '(org-return-follows-link t)
 '(org-todo-keyword-faces (quote (("CANCELED" :foreground "green") ("DONE" . "green") ("WAIT" . "cyan") ("TODO" :foreground "red" :weight bold))))
 '(org-todo-keywords (quote ((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)"))))
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(template-use-package t)
 '(tool-bar-mode nil)
 '(yas-snippet-dirs (quote ("/home/bendik/.emacs.d/plugins/yasnippet/snippets")) nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
