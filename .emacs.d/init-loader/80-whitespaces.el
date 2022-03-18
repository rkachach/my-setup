;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  White spaces handling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ethan-wspace
  :ensure t
  :demand
  :preface (require 'helm-config)
  :config
  (mode-require-final-newline nil)
  (global-ethan-wspace-mode 1))) ;; disable this mode since the ethan-wspace takes care of it
