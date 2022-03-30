;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  White spaces handling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ethan-wspace
  :ensure t
  :demand
  :preface (require 'helm-config)
  :config
  (setq mode-require-final-newline nil)
  (global-ethan-wspace-mode 1))
