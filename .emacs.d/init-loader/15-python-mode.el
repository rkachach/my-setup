(use-package python
  :init
  :bind
  ( :map python-mode-map
	 ("C-c C-r" . python-indent-shift-right)
	 ("C-c C-l" . python-indent-shift-left)))
