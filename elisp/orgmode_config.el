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
(global-set-key "\C-ci" 'org-insert-link)
(global-set-key (kbd "C-c C-x C-j") 'org-clock-goto)
(global-set-key (kbd "C-c c") 'org-capture)

;; org-agenda-files variable that decides what is included in the agenda
(setq org-agenda-files (quote ("~/org")))
(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'kill-emacs-hook 'org-mobile-push)
(add-hook 'after-init-hook 'org-mobile-pull)
(defun me/org-mobile-pull-push ()
  (interactive)
  (org-mobile-pull)
  (org-mobile-push))
;; (run-with-timer 3600 3600 'me/org-mobile-pull-push) ;; run in an hour, every hour

;; ;; ========================================
;; ;; to see a word count that updates every second
;; ;;
;; (defvar count-words-buffer
;;   nil
;;   "*Number of words in the buffer.")

;; (defun wicked/update-wc ()
;;   (interactive)
;;   (setq count-words-buffer (number-to-string (count-words-buffer)))
;;   (force-mode-line-update))
  
;; ; only setup timer once
;; (unless count-words-buffer
;;   ;; seed count-words-paragraph
;;   ;; create timer to keep count-words-paragraph updated
;;   (run-with-idle-timer 10 t 'wicked/update-wc))        ;; <--- edit number to change update rate, number is sec/update

;; ;; add count words paragraph the mode line
;; (unless (memq 'count-words-buffer global-mode-string)
;;   (add-to-list 'global-mode-string " words: " t)
;;   (add-to-list 'global-mode-string 'count-words-buffer t)) 

;; ;; count number of words in current paragraph
;; (defun count-words-buffer ()
;;   "Count the number of words in the current paragraph."
;;   (interactive)
;;   (save-excursion
;;     (goto-char (point-min))
;;     (let ((count 0))
;;       (while (not (eobp))
;; 	(forward-word 1)
;;         (setq count (1+ count)))
;;       count)))

;; ========================================
;; Make checkboxes work with sections as well as lists
(defun wicked/org-update-checkbox-count (&optional all)
  "Update the checkbox statistics in the current section.
This will find all statistic cookies like [57%] and [6/12] and update
them with the current numbers.  With optional prefix argument ALL,
do this for the whole buffer."
  (interactive "P")
  (save-excursion
    (let* ((buffer-invisibility-spec (org-inhibit-invisibility)) 
	   (beg (condition-case nil
		    (progn (outline-back-to-heading) (point))
		  (error (point-min))))
	   (end (move-marker
		 (make-marker)
		 (progn (or (outline-get-next-sibling) ;; (1)
			    (goto-char (point-max)))
			(point))))   
	   (re "\\(\\[[0-9]*%\\]\\)\\|\\(\\[[0-9]*/[0-9]*\\]\\)")
	   (re-box
	    "^[ \t]*\\(*+\\|[-+*]\\|[0-9]+[.)]\\) +\\(\\[[- X]\\]\\)")
	   b1 e1 f1 c-on c-off lim (cstat 0))
      (when all
	(goto-char (point-min))
	(or (outline-get-next-sibling) (goto-char (point-max))) ;; (2)
	(setq beg (point) end (point-max)))
      (goto-char beg)
      (while (re-search-forward re end t)
	(setq cstat (1+ cstat)
	      b1 (match-beginning 0)
	      e1 (match-end 0)
	      f1 (match-beginning 1)
	      lim (cond
		   ((org-on-heading-p)
		    (or (outline-get-next-sibling) ;; (3)
			(goto-char (point-max)))
		    (point))
		   ((org-at-item-p) (org-end-of-item) (point))
		   (t nil))
	      c-on 0 c-off 0)
	(goto-char e1)
	(when lim
	  (while (re-search-forward re-box lim t)
	    (if (member (match-string 2) '("[ ]" "[-]"))
		(setq c-off (1+ c-off))
	      (setq c-on (1+ c-on))))
	  (goto-char b1)
	  (insert (if f1
		      (format "[%d%%]" (/ (* 100 c-on)
					  (max 1 (+ c-on c-off))))
		    (format "[%d/%d]" c-on (+ c-on c-off))))
	  (and (looking-at "\\[.*?\\]")
	       (replace-match ""))))
      (when (interactive-p)
	(message "Checkbox statistics updated %s (%d places)"
		 (if all "in entire file" "in current outline entry")
		 cstat)))))
(defadvice org-update-checkbox-count (around wicked activate)
  "Fix the built-in checkbox count to understand headlines."
  (setq ad-return-value
	(wicked/org-update-checkbox-count (ad-get-arg 1))))




;; ========================================
;; Moblie org setup
(setq org-mobile-directory "/home/bendik/programs/Dropbox/Apps/MobileOrg")

;; TODO states
;; @ :: prompt for a note to store with a timestamp when entering/leaving state
;; ! :: timestamp when leaving state
;; @/! :: store note and timestamp on entry, and timestamp on the way out (if target state does not allready do this)
(setq org-todo-keywords
       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))

;; Clocking
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


;; activate flyspell by default
(add-hook 'org-mode-hook 'flyspell-mode)

;; (require 'org-latex)
;; (setq org-export-latex-listings 'minted)
;; (add-to-list 'org-export-latex-packages-alist '("" "minted"))
;; (setq org-src-fontify-natively t)

(defun my-org-clocktable-indent-string (level)
  (if (= level 1)
      ""
    (let ((str "\\"))
      (while (> level 2)
        (setq level (1- level)
              str (concat str "__")))
      (concat str "__ "))))

(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)
