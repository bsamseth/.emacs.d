;; This file is for mode specific preferences


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
(setq reftex-plug-into-AUCTeX t)
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
;; (require 'yasnippet)
;; (yas-global-mode nil)

(add-to-list 'load-path
              "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
(ac-config-default)

;; auto close paren., and brackets
(electric-pair-mode 1)
