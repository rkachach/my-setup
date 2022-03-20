(setq make-backup-files nil) ; stop creating ~ files

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Copy & Pase stuff

(setq info-buffers '("*Anaconda*" "*xref*" "*cscope*" "*Occur*" "*grep*" "*etags-select*" "*Output*" "*vc-diff*" "*vc-change-log*" "*Register List*" "* OmniSharp : Usages *" "*Diff*" "*Org Agenda*"))

(defun kill-and-join-forward (&optional arg)
  "If at end of line, join with following; otherwise kill line.
    Deletes whitespace at join."
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (delete-indentation t)
    (kill-line arg)))

(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line "
  (interactive "P")
  (let ((beg (line-beginning-position))
        (end (line-end-position arg)))
    ;; copy the end-of-line char also (end+1)
    (copy-region-as-kill beg (+ end 1)))
  )

(defun copy-paragraph (&optional arg)
  "Copy paragraphes at point"
  (interactive "P")
  (let ((beg (progn (backward-paragraph 1) (point)))
        (end (progn (forward-paragraph arg) (point))))
    (copy-region-as-kill beg end))
  )

(defun copy-kill (action thing)
  "copy or kill things. action is a symbol, can be 'copy or 'kill. thing is a symbol which specifies the kind of syntactic entity you want.
Possibilities include `symbol', `list', `sexp', `defun', `filename', `url',
`email', `word', `sentence', `whitespace', `line', `page' and others.
ref `bounds-of-thing-at-point'."
  (interactive)
  (let ((pos (bounds-of-thing-at-point thing)))
    (cond ((eq action 'copy) (copy-region-as-kill (car pos) (cdr pos)))
          ((eq action 'kill) (kill-region (car pos) (cdr pos)))
          (t (message "wrong action %s" action)))))

;; better than yw function in vim
(defun copy-symbol ()
  ;; TODO symbol doesn't allow "." in them, but I want copy-symbol to contain everything except space
  ;; It could be called copy-word. But in emacs word doesn't contain - / etc. copy-symbol copys the thing between
  ;; spaces to kill ring."
  "It could be called copy-word. But in emacs word doesn't contain - / etc."
  (interactive)
  (copy-kill 'copy 'symbol))

;; more than y% function in vim
;; because can copy word when not at (
(defun copy-sexp ()
  "copy sexp under point."
  (interactive)
  (copy-kill 'copy 'sexp))

(defun my-kill-line ()
  "kill current line. you don't have to put point at the beginning of line."
  (interactive)
  (copy-kill 'kill 'line))

(defun my-kill-symbol ()
  "kill symbol at point."
  (interactive)
  (copy-kill 'kill 'symbol))

(defun my-kill-sexp ()
  "kill sexp at point. may be no better than default `kill-sexp'. But I can use uniform prefix keys, that's a bonus."
  (interactive)
  (copy-kill 'kill 'sexp))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; kill white-spaces and "enclosed" text functions

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

;; returns the enclosing character for the character "c"
(defun get-enc-char (c) (cond
                         ((string= c "(") ")")
                         ((string= c "[") "]")
                         ((string= c "{") "}")
                         ((string= c ">") "<")
                         ((string= c "<") ">")
                         ((string= c "'") "'")
                         ((string= c "\"") "\"")
                         (t nil)
                         )
  )

(defun delete-enclosed-text ()
  "Delete texts between any pair of delimiters."
  (interactive)
  (save-excursion
    (let (p1 p2 mychar)
      ; look for one of those characters and store the cursor position
      (skip-chars-backward "^([\'\"><{") (setq p1 (point))
      ; store the char at this point, look for its enclosed char and advance
      ; the cursor newly (this done to avoid the cases when the char and
      ; its enclosed-char are the same like " or ' chars.
      (backward-char 1) (setq mychar (thing-at-point 'char)) (forward-char 1)
      ; look forward for the enclosed char
      (skip-chars-forward (concatenate 'string "^" (get-enc-char mychar))) (setq p2 (point))
      ; only delete the region if we found the enclosed character
      (if (looking-at "[\]\}\"\'\)<>]") (kill-region p1 p2)))))

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

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
