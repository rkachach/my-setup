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
         ("C-x c o" . helm-occur)
	 ("C-x r b" . helm-filtered-bookmarks)
	 ("C-x C-y" . 'helm-show-kill-ring)
	 ("C-x y" . 'helm-flyspell-correct)
	 ("C-x C-n" . 'helm-swoop)) ;; TODO: fixme not defined

  :preface (require 'helm-config)
  :config
  (setq helm-split-window-inside-p            t ; open helm buffer inside current window, not occupy whole other window
	helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
	helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
	helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
	helm-M-x-fuzzy-match t
	helm-apropos-fuzzy-match t
	helm-ff-file-name-history-use-recentf t
	helm-buffers-fuzzy-matching t
	helm-completion-in-region-fuzzy-match t
	helm-etags-fuzzy-match t
	helm-ff-file-name-history-use-recentf t
	helm-ff-search-library-in-sexp t
	helm-file-cache-fuzzy-match t
	helm-imenu-fuzzy-match t
	helm-lisp-fuzzy-completion t
	helm-locate-fuzzy-match t
	helm-mode t
	helm-mode-fuzzy-match t
	helm-move-to-line-cycle-in-source t
	helm-recentf-fuzzy-match t)
  (helm-adaptive-mode t)
  (helm-mode 1))

(use-package helm-projectile
  :ensure t
  :config
  (projectile-mode)
  (helm-projectile-on))
