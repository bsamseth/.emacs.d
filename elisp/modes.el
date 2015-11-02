;; This file is for mode specific preferences



;; ========================================
;; Helm
;; ========================================
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)
      
(helm-autoresize-mode t)                     ; helm window can adjust size depending on number of candidates
(define-key my-mode-map (kbd "M-x") 'helm-M-x)              ; use helm version of standard functions
(define-key my-mode-map (kbd "C-x C-f") 'helm-find-files)
(define-key my-mode-map (kbd "C-x b") 'helm-mini)
(define-key my-mode-map (kbd "C-x C-b") 'helm-mini)
(define-key my-mode-map (kbd "M-p") 'helm-semantic-or-imenu)
(define-key my-mode-map (kbd "M-y") 'helm-show-kill-ring)
(define-key my-mode-map (kbd "C-c h g") 'helm-google-suggest)  ; very neat!
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for some functions
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
;; (helm-mode 1)



;; ========================================
;; Flycheck (live syntax and style checking)
;; ========================================


;; ========================================
;; Python
;; ========================================
(add-hook 'python-mode-hook
  (lambda () (setq python-indent-offset 4)
    (require 'company-jedi)
    (autoload 'jedi:setup "jedi" nil t)
    (add-hook 'python-mode-hook 'jedi:setup)
    (add-to-list 'company-backends 'company-jedi)
    )
)
(defadvice auto-complete-mode (around disable-auto-complete-for-python)
  (unless (eq major-mode 'python-mode) ad-do-it))

(ad-activate 'auto-complete-mode)


;; ========================================
;; LaTeX
;; ========================================
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

;; fix verbatim highlight bug
(setq LaTeX-verbatim-environments-local '("Verbatim" "lstlisting"))

(require 'company-auctex)
(company-auctex-init)


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





;; ;; ========================================
;; ;; Company (Complete Anything)
;; ;; ========================================
(require 'company)
(company-mode-on)
;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-backends 'company-math-symbols-latex)
;; (add-to-list 'company-backends 'company-latex-commands)
;; (add-to-list 'company-backends 'company-web-html)
;; (add-to-list 'company-backends 'company-anaconda)
;; (add-to-list 'company-backends 'company-jedi)
;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-irony))
(add-hook 'after-init-hook 'global-company-mode)


;; ========================================
;; Emacs Code Browser (ECB)
;; ========================================
;;; activate ecb
(require 'ecb)
(require 'ecb-autoloads)

(setq ecb-layout-name "left3")
(setq ecb-compile-window-height 12)



;; ========================================
;; Markdown Mode
;; =========================================
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '("README" . markdown-mode))

;; make øæå work in latex and org mode, and set the ;'[] to M- and then the key

(add-hook 'markdown-mode-hook 
          (lambda () (local-set-key (kbd "[") #'(lambda () (interactive) (insert "å")))))
(add-hook 'markdown-mode-hook
          (lambda () (local-set-key (kbd ";") #'(lambda () (interactive) (insert "ø")))))
(add-hook 'markdown-mode-hook
          (lambda () (local-set-key (kbd "'") #'(lambda () (interactive) (insert "æ")))))
(add-hook 'markdown-mode-hook
          (lambda () (local-set-key (kbd "M-;") #'(lambda () (interactive) (insert ";")))))
(add-hook 'markdown-mode-hook
          (lambda () (local-set-key (kbd "M-[") #'(lambda () (interactive) (insert "[")))))
(add-hook 'markdown-mode-hook
          (lambda () (local-set-key (kbd "M-]") #'(lambda () (interactive) (insert "]")))))
(add-hook 'markdown-mode-hook
          (lambda () (local-set-key (kbd "M-'") #'(lambda () (interactive) (insert "'")))))



;; ========================================
;; Edit text fields in Chrome with Emacs
;; ========================================
(when (require 'edit-server nil t)
  (setq edit-server-new-frame nil)
  (edit-server-start))



;; ========================================
;; Misc
;; ========================================
;; disable autocomplete-mode in minibuffer, IDO does that allready
(add-hook 'minibuffer-setup-hook (lambda () (auto-complete-mode -1)))
(winner-mode 1)

;; Spellchecking
(setq ispell-dictionary "norsk")
(define-key my-mode-map (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)


;; c style
(setq c-default-style "java" c-basic-offset 4)

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

;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/auto-complete")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
;; (ac-config-default)

;; auto close paren., and brackets
(electric-pair-mode 1)

(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")
(require 'magit)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/.emacs.d/site-lisp/magit/Documentation/"))
