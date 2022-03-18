;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               CSCOPE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq cscope-do-not-update-database t)
(load-library "xcscope.el")
(require 'xcscope)

(global-set-key (kbd "C-c o") 'cscope-find-this-text-string)
(global-set-key (kbd "C-c p d") 'cscope-find-global-definition)
(global-set-key (kbd "C-c p j") 'cscope-find-this-symbol)
(global-set-key (kbd "C-c p i") 'cscope-find-this-file)
(global-set-key (kbd "C-c p f") 'cscope-find-functions-calling-this-function)
(global-set-key (kbd "C-c s i") 'cscope-find-files-including-file)
(global-set-key (kbd "C-c u") 'cscope-pop-mark)
(global-set-key (kbd "C-c C-j") 'uncomment-region)
(global-set-key (kbd "C-c C-k") 'comment-region)
(global-set-key [(meta n)] 'cscope-next-symbol)
(global-set-key [(meta p)] 'cscope-prev-symbol)

(global-set-key (kbd "C-c j") 'my-cscope-find-this-symbol)
(global-set-key (kbd "C-c d") 'my-cscope-find-global-definition)
(global-set-key (kbd "C-c i") 'my-cscope-find-this-file)
(global-set-key (kbd "C-c f") 'my-cscope-find-functions-calling-this-function)

;; Don't prompt for the tag-name, use the word on the current cursor position
(defun my-cscope-find-this-symbol ()
  "My find-symbol wrapper for easy repetition (VJO 2003).
 Call `find-symbol' with current word first time and after that call
 find-symbol with NEXT-P set to t (if called repeatedly)"
  (interactive)
  (if (eq last-command 'my-cscope-find-this-symbol)
      (cscope-find-this-symbol nil t)
    (progn
      (cscope-find-this-symbol (current-word))
      )
    )
  )

;; Don't prompt for the tag-name, use the word on the current cursor position
(defun my-cscope-find-global-definition ()
  "My find-symbol wrapper for easy repetition (VJO 2003).
 Call `find-symbol' with current word first time and after that call
 find-symbol with NEXT-P set to t (if called repeatedly)"
  (interactive)
  (if (eq last-command 'my-cscope-find-global-definition)
      (cscope-find-global-definition nil t)
    (progn
      (cscope-find-global-definition (current-word))
      )
    )
  )

;; Don't prompt for the tag-name, use the word on the current cursor position
(defun my-cscope-find-this-file ()
  "My find-symbol wrapper for easy repetition (VJO 2003).
 Call `find-symbol' with current word first time and after that call
 find-symbol with NEXT-P set to t (if called repeatedly)"
  (interactive)
  (if (eq last-command 'my-cscope-find-this-file)
      (cscope-find-this-file nil t)
    (progn
      (cscope-find-this-file (current-word))
      )
    )
  )

;; Don't prompt for the tag-name, use the word on the current cursor position
(defun my-cscope-find-functions-calling-this-function ()
  "My find-symbol wrapper for easy repetition (VJO 2003).
 Call `find-symbol' with current word first time and after that call
 find-symbol with NEXT-P set to t (if called repeatedly)"
  (interactive)
  (if (eq last-command 'my-cscope-find-functions-calling-this-function)
      (cscope-find-functions-calling-this-function nil t)
    (progn
      (cscope-find-functions-calling-this-function (current-word))
      )
    )
  )
