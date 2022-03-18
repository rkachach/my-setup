;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               General Key bindind
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; disable C-x, C-z (normally suspends or minimizes emacs)
(global-unset-key [(control x) (control z)])
(global-unset-key [(control return)])

(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (remove-if-not 'buffer-file-name (buffer-list)))))

(defun kill-info-buffers()
  (interactive)
  (save-current-buffer
    (progn
      (setq orig-buffer (buffer-name))
      (let (counter buffers-count)
        (setq buffers-count (length info-buffers))
        (setq counter 0)

        (while (< counter buffers-count)
          (when (get-buffer (nth counter info-buffers))
            (message "Killing %s" (nth counter info-buffers))
            (kill-buffer (get-buffer (nth counter info-buffers)))
            )
          (setq counter (+ counter 1))
          )
        )

      ;; Check whether if we was in the killed buffer in this case move to the
      ;; the other window and close all the remaining windows, else just close
      ;; all the windows except the current one
      (if (member orig-buffer info-buffers)
          (progn
            (other-window 1)
            (delete-other-windows))
          (delete-other-windows))

    )))

(defun kill-whitespace ()
  "Kill the whitespace between two non-whitespace characters"
  (interactive "*")
  (save-excursion
    (save-restriction
      (save-match-data
        (progn
          (re-search-backward "[^ \t\r\n]" nil t)
          (re-search-forward "[ \t\r\n]+" nil t)
          (replace-match "" nil nil))))))

(defun kill-and-join-forward (&optional arg)
  "If at end of line, join with following; otherwise kill line.
    Deletes whitespace at join."
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (delete-indentation t)
    (kill-line arg)))

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key [(control t)] 'indent-region)
(global-set-key [(control z)] 'undo) 
(global-set-key (kbd "C-z") 'undo)
(global-set-key [(meta g)] 'goto-line)
(global-set-key [(control return)] 'query-replace)
(global-set-key [(meta return)] 'replace-regexp)
(global-set-key [(meta m)] 'ff-find-related-file)
(global-set-key [(meta o)] 'other-window)
(global-set-key [(meta a)] 'back-to-indentation)
(global-set-key (kbd "C-x r r") 'narrow-to-region)
(global-set-key (kbd "C-x w") 'widen)
(global-set-key (kbd "C-x j") 'narrow-to-defun)

;; quick keyboard jump
(global-set-key [(control f)] '(lambda () (interactive) (forward-paragraph) (redraw-display)))
(global-set-key [(control b)] '(lambda () (interactive) (backward-paragraph) (redraw-display)))
(global-set-key [(meta b)] 'backward-word)
(global-set-key [(meta f)] 'forward-word)
(global-set-key [(meta .)] 'forward-char)
(global-set-key [(meta \,)] 'backward-char)
(global-set-key [(control .)] 'next-line)
(global-set-key [(control \,)] 'previous-line)

;; remember mouse pointer
(global-set-key (kbd "C-c r r") '(lambda () (interactive) (point-to-register ?x)))
(global-set-key (kbd "C-c r p") '(lambda () (interactive) (jump-to-register ?x)))

(global-set-key [(control j)] 'isearch-forward-symbol-at-point)
(global-set-key (kbd "C-c e") '(lambda () (interactive) (end-of-buffer) (redraw-display)))
(global-set-key (kbd "C-c b") '(lambda () (interactive) (beginning-of-buffer) (redraw-display)))
(global-set-key (kbd "C-x C-t") 'helm-etags-select)
(global-set-key (kbd "C-x C-j") 'idomenu)
(global-set-key (kbd "C-x r v") 'register-list)
(global-set-key (kbd "C-x o") 'helm-occur)

;; was just-one-space
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; quick white-spaces and other removal commands
(global-set-key (kbd "C-c s k") 'just-one-space)
(global-set-key (kbd "C-0") 'delete-enclosed-text)
(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-q") 'kill-info-buffers)

(global-set-key [(control k)] 'kill-and-join-forward)

;; auto-indent after RET
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "C-c g") 'my-grep)
(define-key global-map (kbd "C-8") 'multi-term-dedicated-open)
(define-key global-map (kbd "C-x C-o") 'company-complete)
(define-key global-map (kbd "<f5>") 'redraw-display)

(define-key global-map (kbd "<f6>") 'beautify-json)
(global-set-key (kbd "C-M-g") 'switch-to-previous-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(global-set-key (kbd "M-0") 'my-kill-symbol)
(global-set-key (kbd "M-s") 'copy-symbol)
(global-set-key (kbd "M-l") (quote copy-line))
(global-set-key (kbd "M-k") 'my-kill-line)
(global-set-key (kbd "M-t") 'helm-imenu)
(global-set-key (kbd "C-x l") (lambda () (interactive) (insert "[]") (backward-char 1)))
(global-set-key (kbd "C-x p") (lambda () (interactive) (insert "()") (backward-char 1)))
(global-set-key (kbd "C-x ,") (lambda () (interactive) (insert "::")))
(global-set-key (kbd "C-x c") (lambda () (interactive) (insert "{}") (backward-char 1)))
(global-set-key (kbd "C-x n") (lambda () (interactive) (insert "\"\"")(backward-char 1)))
(global-set-key (kbd "C-c h") 'kill-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Cua mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq cua-enable-cua-keys nil) ;; only for rectangles
(setq cua-rectangle-mark-key (kbd "C-M-<return>")) ;; Rebind the mark rectangle key
(cua-mode t)

(helm-adaptive-mode t) ;; Order commands by the frequency of use
(global-set-key (kbd "C-x C-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x y") 'helm-flyspell-correct)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               TAGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TAGS quick browing
(global-set-key "\M-i" 'helm-etags-plus-select)
;;(global-set-key "\M-i" 'etags-select-find-tag-at-point)
;;(global-set-key "\C-p" 'pop-tag-mark)
;;(global-set-key "\C-n" 'my-find-tag)
(add-hook
 'c++-mode-hook
 (lambda ()
   (local-set-key (kbd "\C-n") 'my-find-tag)
   (local-set-key (kbd "\C-p") 'pop-tag-mark)
   ))
