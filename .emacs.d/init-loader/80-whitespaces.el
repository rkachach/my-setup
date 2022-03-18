;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  White spaces handling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ethan-wspace
  :ensure t
  :demand
  :preface (require 'helm-config)
  :config
  (global-ethan-wspace-mode 1)
  (mode-require-final-newline nil))) ;; disable this mode since the ethan-wspace takes care of it

