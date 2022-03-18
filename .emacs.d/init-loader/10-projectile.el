(use-package projectile
  :ensure t
  :demand
  :bind-keymap ("C-p" . projectile-command-map)
  :bind (("C-c C-f" . helm-find-files))
  :config
  (projectile-completion-system 'helm)
  (helm-projectile-on)
  (projectile-mode)
  (projectile-global-mode))
