;; set themes, change from M-x customize-themes. New themes goes in the following folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(add-to-list 'load-path
              "~/.emacs.d/elpa/")
;;Things added by changing things through customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (lush)))
 '(custom-safe-themes (quote ("1ba463f6ac329a56b38ae6ac8ca67c8684c060e9a6ba05584c90c4bffc8046c3" "1636c901ca6cedd80bea5d97b59238ee9467b712a2cf39c8bb1cd3a49cc6f0ba" "4cefd96dbec5c775b1b396989d695d6b1cd4961f6ad78595f4ef45d8805a88da" default)))
 '(menu-bar-mode nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(template-use-package t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;END OF Things added by changing things through customize

(defalias 'yes-or-no-p 'y-or-n-p) ;; y bother indead

;; lisp goodness loads from here
(setq load-path (cons (expand-file-name "~/.emacs.d/lisp/")
                            load-path))
(require 'template) ;; templates for files, i.e. Oblig template
(template-initialize)




;; some latex config
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
;;(add-hook 'LaTeX-mode-hook 'fly-spell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq-default TeX-PDF-mode t)
;; (eval-after-load 'latex 
;;   '(define-key LaTeX-mode-map ("[") (lambda () 
;; 					(interactive)
;; 					(insert "å"))))

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
          (lambda () (local-set-key (kbd "M-'") #'(lambda () (interactive) (insert "'")))))





















;; activate melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; activate snippets
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)



;;
;; ace jump mode major function
;; 
(add-to-list 'load-path "~/.emacs.d/plugins/ace-jump-mode/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c C-u SPC") 'ace-jump-char-mode)
(define-key global-map (kbd "C-c C-u C-u SPC") 'ace-jump-line-mode)


;; auto close paren., and brackets
(electric-pair-mode 1)

;; open menu-bar 
(define-key global-map (kbd "M-m") 'menu-bar-open)
;; line numbers
(global-linum-mode 1)
(setq linum-format "%d ")



;; make wasd movement keys
;; first remap M-w (copy) to M-k
(define-key global-map (kbd "M-k") 'kill-ring-save)
(define-key global-map (kbd "M-w") 'previous-line)
(define-key global-map (kbd "M-s") 'next-line)
(define-key global-map (kbd "M-a") 'backward-char)
(define-key global-map (kbd "M-d") 'forward-char)
;; M-q and M-e as backward and forward word
(define-key global-map (kbd "M-e") 'forward-word)
(define-key global-map (kbd "M-q") 'backward-word)
;; use forward/backwawrd sexp
(define-key global-map (kbd "M-C-q") 'backward-sexp)
(define-key global-map (kbd "M-C-e") 'forward-sexp)
;; and M-r and M-f as backward and forward paragraph
(define-key global-map (kbd "M-f") 'forward-paragraph)
(define-key global-map (kbd "M-r") 'backward-paragraph) 
;; swap out beginning-of-line with back-to-indentation, skips forward to the start of the line
(define-key global-map (kbd "C-a") 'back-to-indentation) 


;; use imenu-anywhere!
(define-key global-map (kbd "M-p") 'imenu-anywhere)

;; comment and uncomment region mapped to C-9
(defun me/comment-region ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(define-key global-map (kbd "C-9") 'me/comment-region)


;; replaces current C-SPC with one that toggles the mark, instead of replacing it.
(defun me/set-mark ()
  (interactive)
  (if mark-active
      (setq mark-active nil)
      (progn (push-mark) (setq mark-active t))
  )
)
(global-set-key (kbd "C-SPC") 'me/set-mark) ;; simply replace



;; multiple cursors 
(require 'multiple-cursors)
(defun me/mark-word ()
 "Marks the entire word where the cursor is. Replaces mark-word. Should be used through me/multiple-words, C-d"
  (interactive)
  (forward-char)
  (backward-word)
  (push-mark)
  (forward-word)
  (setq mark-active t)
)
(defun me/multiple-words ()
  "Does the same as Sublimes C-d, marks word if no selection, and selects next if something is selected."
  (interactive)
  (if mark-active
    (mc/mark-next-symbol-like-this 1)
    (me/mark-word)
  )
)
(global-set-key (kbd "C-d") 'me/multiple-words) ;; mark the current word, and mark the next if any for each use
(global-set-key (kbd "C-M-d") 'mc/mark-all-symbols-like-this) ;; mark all occurrences of the word
(global-set-key (kbd "C-M-S-d") 'mc/mark-all-like-this);; --""--, but include when inside other characters



;; Line selection now works by C-l or C-S-l for reverse selection.

(defun me/select-line ()
  "Select the current line. If used multiple times, next line is also selected."
  (interactive)
  (if mark-active
      (progn
	(end-of-line) 
	(forward-char)
	(end-of-line))
      (progn
	(beginning-of-line)
	(me/set-mark)
	(end-of-line))
  )
)
(defun me/select-previous-line ()
  "Select the previous line. If there is an active region, prev. line is added. If used multiple times, next (prev.prev) line is also selected."
  (interactive)
  (if (region-active-p)
      (progn
	(save-excursion 
	  (region-end)
	  (me/set-mark)
	  (me/set-mark)
	  )
	(beginning-of-line) 
	(backward-char)
	(beginning-of-line))
      (progn
	(previous-line)
	(end-of-line)
	(me/set-mark)
	(beginning-of-line))
  )
)
(global-set-key (kbd "C-l") 'me/select-line)
(global-set-key (kbd "C-S-l") 'me/select-previous-line)



(defun me/fullscreen (&optional f)
 "Function that toggles maximized window (not actually FULL-screen). Doesn't work under gnome for some reason"
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
               '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
               '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(global-set-key (kbd "<f11>") 'me/fullscreen)
(me/fullscreen)

;; Don't show start up message on launch
(setq inhibit-startup-message t)





;; supercharge completion and stuff. Super fuzzy completion --> tii in .emacs.d/ gives init.el !
(require 'ido)
(ido-mode t)
(ido-vertical-mode 1)
(require 'ido-better-flex)
;;(require 'ido-ubiquitous)
(ido-better-flex/enable)
(ido-ubiquitous-mode 1)
;; Smex
(autoload 'smex "smex"
   "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")

(global-set-key (kbd "M-x") 'smex)




(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))



