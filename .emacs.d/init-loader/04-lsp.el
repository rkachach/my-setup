;;(use-package lsp-pyright
;;  :ensure t
;;  :hook (python-mode . (lambda ()
;; 			 (require 'lsp-pyright)
;; 			 (lsp-deferred))))  ; or lsp-deferred

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :bind (("C-p" . xref-pop-marker-stack)
	 ("C-n" . xref-find-definitions)
	 ("M-r" . lsp-find-references))
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         (go-mode . lsp)
         (c++-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :config (setq
	   lsp-idle-delay 0.500
	   lsp-log-io nil
	   read-process-output-max (* 1024 1024))
  :commands (lsp lsp-deferred))

;; optionally
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
