;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  Helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm
  :ensure t
  :demand
  :bind (("C-c h" . helm-command-prefix)
	 ("C-z" .  'helm-select-action) ; list actions using C-z
	 ("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)
         ("C-x c o" . helm-occur))
         ("M-y" . helm-show-kill-ring)
         ("C-x r b" . helm-filtered-bookmarks)
	 ("C-x C-y" . 'helm-show-kill-ring)
	 ("C-x y" . 'helm-flyspell-correct)
	 ("C-x C-n" . 'helm-swoop)

  :preface (require 'helm-config)
  :config
  (helm-adaptive-mode t)
  (helm-mode 1))

(use-package helm-projectile
  :ensure t
  :config
  (projectile-global-mode)
  (helm-projectile-on))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)
