(use-package python
  :init
  :bind
  ( :map python-mode-map
	 ("C-c C-r" . python-indent-shift-right)
	 ("C-c C-l" . python-indent-shift-left))
  :hook
  ;; With pyls:
  ;; pip install python-language-server flake8 pyls-black(optional) pyls-isort(optional)
  ;; With pyright
  ;; sudo npm install -g pyright && pip install flake8 black(optional)
  ;; NOTE: these hooks runs in reverse order
  (python-mode . (lambda () (setq-local company-prescient-sort-length-enable nil)))
  (python-mode . (lambda () (setq-local fill-column 79)))
  :config
  )
