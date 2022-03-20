;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Dired configuration

(require 'dired-aux)

(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "C-p") 'dired-up-directory)
     (define-key dired-mode-map (kbd "C-n") 'dired-find-file)
     (define-key dired-mode-map (kbd "C-S-n") 'dired-create-directory)))

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))))))

;; Copy the selected file to the splited window
(setq dired-dwim-target t)

;; Make sizes human-readable by default, sort version numbers
;; correctly, and put dotfiles and capital-letters first.
(setq-default dired-listing-switches "-alhv")

;; One buffer is created for all the visited directories
(put 'dired-find-alternate-file 'disabled nil)

;; Do not prompt for "recursive coppy"
(setq dired-recursive-copies 'always)

;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook 'auto-revert-mode)

(require 'dired-efap) ;; By JL
(define-key dired-mode-map [f2] 'dired-efap)
