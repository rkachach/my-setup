(use-package projectile
  :ensure t
  :demand
  :bind-keymap ("C-p" . projectile-command-map)
  :bind (("C-c C-f" . helm-find-files))
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-indexing-method 'alien)
  (setq projectile-sort-order 'recentf)
  (setq projectile-enable-caching nil)
  (setq projectile-completion-system 'helm)
  (helm-projectile-on)
  (projectile-mode))
