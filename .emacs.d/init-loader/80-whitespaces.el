;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  White spaces handling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ethan-wspace
  :ensure t
  :diminish 'ethan-wspace-mode
  :init (setq mode-require-final-newline nil
              require-final-newline nil)
  :config (global-ethan-wspace-mode 1)
  )
