;; This file is for mode specific preferences

;; disable autocomplete-mode in minibuffer, IDO does that allready
(add-hook 'minibuffer-setup-hook (lambda () (auto-complete-mode -1)))

;; Spellchecking
(setq ispell-dictionary "norsk")
(define-key my-mode-map (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)


;; c style
(setq c-default-style "java" c-basic-offset 4)


;; Latex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
;;(add-hook 'LaTeX-mode-hook 'fly-spell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'orgtbl-mode)

(setq reftex-plug-into-AUCTeX t)
;; So that RefTeX finds my bibliography
(setq reftex-default-bibliography '("~/bibliography/database"))
;; So that RefTeX also recognizes \addbibresource. Note that you
;; can't use $HOME in path for \addbibresource but that "~"
;; works.
(setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
(setq-default TeX-PDF-mode t)

;; make øæå work in latex and org mode, and set the ;'[] to M- and then the key

(add-hook 'LaTeX-mode-hook 
          (lambda () (local-set-key (kbd "[") #'(lambda () (interactive) (insert "å")))))
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd ";") #'(lambda () (interactive) (insert "ø")))))
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "'") #'(lambda () (interactive) (insert "æ")))))
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "M-;") #'(lambda () (interactive) (insert ";")))))
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "M-[") #'(lambda () (interactive) (insert "[")))))
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "M-]") #'(lambda () (interactive) (insert "]")))))
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "M-'") #'(lambda () (interactive) (insert "'")))))


(add-hook 'org-mode-hook 
          (lambda () (local-set-key (kbd "[") #'(lambda () (interactive) (insert "å")))))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd ";") #'(lambda () (interactive) (insert "ø")))))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "'") #'(lambda () (interactive) (insert "æ")))))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "M-;") #'(lambda () (interactive) (insert ";")))))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "M-[") #'(lambda () (interactive) (insert "[")))))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "M-]") #'(lambda () (interactive) (insert "]")))))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "M-'") #'(lambda () (interactive) (insert "'")))))




;; lisp goodness loads from here
(setq load-path (cons (expand-file-name "~/.emacs.d/lisp/")
                            load-path))
(require 'template) ;; templates for files, i.e. Oblig template
(template-initialize)


;; ;; activate snippets
;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode t)

(add-to-list 'load-path
              "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
(ac-config-default)

;; auto close paren., and brackets
(electric-pair-mode 1)



;; ========================================
;; Web browsing with w3m
;; ========================================

;;change default browser for 'browse-url'  to w3m
(setq browse-url-browser-function 'w3m-goto-url-new-session)
 
;;change w3m user-agent to android
(setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")
 
;;i need this often
(defun wikipedia-search (search-term)
  "Search for SEARCH-TERM on wikipedia"
  (interactive
   (let ((term (if mark-active
                   (buffer-substring (region-beginning) (region-end))
                 (word-at-point))))
     (list
      (read-string
       (format "Wikipedia (%s):" term) nil nil term)))
   )
  (browse-url
   (concat
    "http://en.m.wikipedia.org/w/index.php?search="
    search-term
    ))
  )

;;when I want to enter the web address all by hand
(defun w3m-open-site (site)
  "Opens site in new w3m session with 'http://' appended"
  (interactive
   (list (read-string "Enter website address(default: w3m-home):" nil nil w3m-home-page nil )))
  (w3m-goto-url-new-session
   (concat "http://" site)))
