;; This file is for custom key bindings and special functions
;; First load my own minor mode. All custom keys should be bound
;; to the corresponding key-map. This ensures precedence over any major mode
(load "my-mode") ;; load file with the mode definitions, my-mode.el
(define-globalized-minor-mode global-my-mode
  my-mode turn-on-my-mode) ;; enable it globaly
(global-my-mode 1)


;; ========================================
;; Standard functions

;; open menu-bar with M-m
(define-key my-mode-map (kbd "M-m") 'menu-bar-open)
;; swap out beginning-of-line with back-to-indentation
(define-key my-mode-map (kbd "C-a") 'back-to-indentation) 
;; auto ident
;; this should not be in my-mode, since it should be overriden where it needs to, e.g. to follow links in manual
(global-set-key (kbd "RET") 'newline-and-indent)
;; going to next line when there is none will make a new line
(setq next-line-add-newlines t)
;; shortcut for querry replace
(define-key my-mode-map (kbd "C-S-r") 'query-replace-regexp)
;; make C-x C-k also kill buffer
(define-key my-mode-map (kbd "C-x C-k") 'ido-kill-buffer)
;; shortcut for gnus mail
(define-key my-mode-map (kbd "C-c C-m") 'gnus)
;; shortcut
(define-key my-mode-map (kbd "C-M-!") 'me/shell)
;; Completion
(define-key my-mode-map (kbd "C-q") 'dabbrev-expand)

;; ========================================
;; Functions made by myself

;; start a shell in a buffer called terminal
(defun me/shell ()
  "Starts a shell in a buffer called terminal"
  (interactive)
  (shell "terminal"))

;; set the mark, without starting an active region
(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
   Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))

;; jump to the mark without activating the region
(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
  This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))

(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))


(define-key my-mode-map (kbd "C-`") 'push-mark-no-activate)
(define-key my-mode-map (kbd "M-`") 'jump-to-mark)
(define-key my-mode-map (kbd "C-x C-x") 'exchange-point-and-mark-no-activate)


;; comment and uncomment region mapped to C-f9
(defun me/comment-region ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(define-key my-mode-map (kbd "C-<f9>") 'me/comment-region)

;; 
(defun me/set-mark ()
  "Replaces current set-mark with one that toggles the mark, instead of replacing it."
  (interactive)
  (if mark-active
      (setq mark-active nil)
      (progn (push-mark) (setq mark-active t))
  )
)
(define-key my-mode-map (kbd "C-SPC") 'me/set-mark) 

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
(define-key my-mode-map (kbd "C-d") 'me/multiple-words) ;; mark the current word, and mark the next if any for each use
(define-key my-mode-map (kbd "C-M-d") 'mc/mark-all-symbols-like-this) ;; mark all occurrences of the word
(define-key my-mode-map (kbd "C-M-S-d") 'mc/mark-all-like-this);; --""--, but include when inside other characters

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
	(end-of-line)
	(me/set-mark)
	(beginning-of-line))
	
  )
)
(define-key my-mode-map (kbd "C-l") 'me/select-line)
(define-key my-mode-map (kbd "C-c C-l") 'recenter-top-bottom) ;; was C-l before
(define-key my-mode-map (kbd "C-S-l") 'me/select-previous-line)


(defun me/fullscreen (&optional f)
 "Function that toggles maximized window (not actually FULL-screen). Doesn't work under gnome for some reason"
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
               '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
               '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(define-key my-mode-map (kbd "<f11>") 'me/fullscreen)


(defun me/kill-all-buffers ()
  "Kill every open buffer"
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
;; (define-key my-mode-map (kbd "C-u C-u C-u C-x k") 'me/kill-all-buffers)
;; ========================================
;; Third party functions
;;

;; ace jump mode major function 
(add-to-list 'load-path "~/.emacs.d/plugins/ace-jump-mode/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key my-mode-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key my-mode-map (kbd "C-c C-u SPC") 'ace-jump-char-mode)
(define-key my-mode-map (kbd "C-c C-u C-u SPC") 'ace-jump-line-mode)


(define-key my-mode-map (kbd "C-c m") 'magit-status)

