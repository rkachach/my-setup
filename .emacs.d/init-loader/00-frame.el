;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Main Theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-theme 'monokai t)
(set-face-attribute 'region nil :background "#8b7500")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Full screen Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;disable all the menus
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(toggle-frame-fullscreen)

;;disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               Powerline mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package powerline
  :ensure t
  :demand
  :init
  (powerline-default-theme)
  (put 'erase-buffer 'disabled nil)
  (add-hook 'after-init-hook 'powerline-reset))
