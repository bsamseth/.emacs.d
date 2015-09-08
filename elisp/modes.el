;; This file is for mode specific preferences


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
;; Misc
;; ========================================
;; disable autocomplete-mode in minibuffer, IDO does that allready
(add-hook 'minibuffer-setup-hook (lambda () (auto-complete-mode -1)))

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
(electric-pair-mode 0)


