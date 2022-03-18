(use-package projectile
  :ensure t
  :demand
  :bind-keymap ("C-p" . projectile-command-map)
  :bind (("C-c C-f" . helm-find-files))
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (helm-projectile-on)
  (projectile-mode))
