;; set themes, change from M-x customize-themes. New themes goes in the following folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-verbatim-environments (quote ("verbatim" "verbatim*" "comment")))
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(company-backends (quote (company-elisp company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf (company-dabbrev-code company-gtags company-etags company-keywords) company-oddmuse company-files company-dabbrev company-math-symbols-latex company-latex-commands)))
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(custom-enabled-themes (quote (lush)))
 '(custom-safe-themes (quote ("1ba463f6ac329a56b38ae6ac8ca67c8684c060e9a6ba05584c90c4bffc8046c3" "1636c901ca6cedd80bea5d97b59238ee9467b712a2cf39c8bb1cd3a49cc6f0ba" "4cefd96dbec5c775b1b396989d695d6b1cd4961f6ad78595f4ef45d8805a88da" default)))
 '(ecb-debug-mode t)
 '(ecb-layout-window-sizes (quote (("left3" (ecb-directories-buffer-name 0.19047619047619047 . 0.35135135135135137) (ecb-sources-buffer-name 0.19047619047619047 . 0.2702702702702703) (ecb-methods-buffer-name 0.19047619047619047 . 0.35135135135135137)))))
 '(ecb-tip-of-the-day nil)
 '(flycheck-display-errors-delay 0)
 '(flycheck-highlighting-mode (quote symbols))
 '(flyspell-issue-message-flag nil)
 '(global-auto-revert-mode t)
 '(global-flycheck-mode t)
 '(global-visible-mark-mode t)
 '(menu-bar-mode 1)
 '(org-agenda-custom-commands (quote (("D" "Daily agenda" ((agenda "" ((org-agenda-span (quote day)) (org-deadline-warning-days 1)))) nil) ("U" "Unscheduled tasks" tags "-SCHEDULED={.+}/!+TODO" nil) ("W" "Weekly agenda (8 days starting today)" ((agenda "" ((org-agenda-start-on-weekday nil) (org-agenda-span 8)))) nil nil))))
 '(org-agenda-default-appointment-duration nil)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-babel-load-languages (quote ((emacs-lisp . t) (latex . t) (python . t))))
 '(org-babel-no-eval-on-ctrl-c-ctrl-c t)
 '(org-capture-templates (quote (("t" "Todo" entry (file+headline "~/org/personlig.org" "GTD") "* TODO %? %i %a" :clock-resume t) ("k" "Kalender" entry (file+headline "~/org/personlig.org" "Kalender") "* APPT %?" :clock-resume t) ("s" "Samtale" entry (file+headline "~/org/personlig.org" "Samtaler") "* %^{Navn} %U %?" :clock-resume t))))
 '(org-clock-idle-time 15)
 '(org-clock-into-drawer 2)
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-mobile-inbox-for-pull "~/org/refile.org")
 '(org-mouse-1-follows-link t)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 9))))
 '(org-return-follows-link t)
 '(org-todo-keyword-faces (quote (("CANCELED" :foreground "green") ("DONE" . "green") ("WAIT" . "cyan") ("TODO" :foreground "red" :weight bold))))
 '(org-todo-keywords (quote ((sequence "TODO(t)" "WAIT(w@/!)" "APPT(a)" "|" "DONE(d!)" "DELEGATED(g!)" "CANCELED(c@)"))))
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(python-indent-offset 4)
 '(send-mail-function nil)
 '(template-use-package t)
 '(tool-bar-mode nil)
 '(user-full-name "Bendik Samseth")
 '(user-mail-address "b.samseth@gmail.com")
 '(yas-snippet-dirs (quote ("/home/bendik/.emacs.d/plugins/yasnippet/snippets")) nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
