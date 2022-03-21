(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "s-l")
  :hook ((python-mode . lsp))
  :commands (lsp lsp-deferred)
  :custom
  (lsp-auto-guess-root t)
  (lsp-keymap-prefix "M-m l")
  (lsp-modeline-diagnostics-enable nil)
  (lsp-keep-workspace-alive nil)
  (lsp-auto-execute-action nil)
  (lsp-before-save-edits nil)
  (lsp-eldoc-enable-hover nil)
  (lsp-diagnostic-package :none)
  (lsp-completion-provider :none)
  (lsp-file-watch-threshold 1500)  ; pyright has more than 1000
  (lsp-enable-links nil)
  (lsp-headerline-breadcrumb-enable nil)
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :bind (("C-p" . xref-pop-marker-stack)
	 ("C-n" . xref-find-definitions)
	 ("M-r" . lsp-find-references))
  :custom-face
  (lsp-face-highlight-read ((t (:underline t :background nil :foreground nil))))
  (lsp-face-highlight-write ((t (:underline t :background nil :foreground nil))))
  (lsp-face-highlight-textual ((t (:underline t :background nil :foreground nil))))
  )

(use-package lsp-ui
  :requires lsp-mode flycheck
  :commands lsp-ui-mode
  :custom-face
  (lsp-ui-doc-background ((t (:background nil))))
  (lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
  :hook (lsp-mode-hook . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-use-childframe f)
  (lsp-ui-flycheck-enable t)
  (lsp-ui-flycheck-list-position 'right)
  (lsp-ui-flycheck-live-reporting t)
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-list-width 60)
  (lsp-ui-peek-peek-height 25)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-border (face-foreground 'default))
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-code-actions t)
  :bind (:map lsp-ui-mode-map
         ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
         ([remap xref-find-references] . lsp-ui-peek-find-references)))

;; optionally
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
