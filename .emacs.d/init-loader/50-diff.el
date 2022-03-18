;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Diff-hl-mode (highlight buffer changes)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package diff-hl
  :ensure t
  :demand
  :config
	(global-diff-hl-mode)
	(define-key diff-hl-mode-map (kbd "M-n") 'diff-hl-next-hunk)
	(define-key diff-hl-mode-map (kbd "M-p") 'diff-hl-previous-hunk)
	(define-key diff-hl-mode-map (kbd "C-c r") 'diff-hl-revert-hunk)
	(define-key diff-hl-mode-map (kbd "C-c t") 'diff-hl-diff-goto-hunk)
	(setq diff-hl-fring-bmp-function 'diff-hl-fringe-bmp-from-type))
