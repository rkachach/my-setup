;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  Company Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :ensure t
  :bind (:map company-active-map
	 ("C-n" . company-select-next)
	 ("C-p" . company-select-previous)
	 ("C-n" . company-select-next)
	 ("C-p" . company-select-previous)
	 ("C-t" . company-search-toggle-filtering))
  :config
  (setq company-idle-delay 0
	company-minimum-prefix-length 2
	company-show-numbers t
	company-tooltip-limit 10
	company-tooltip-align-annotations t
	;; invert the navigation direction if the the completion popup-isearch-match
	;; is displayed on top (happens near the bottom of windows)
	company-tooltip-flip-when-above t)
  (global-company-mode t))

(use-package company-tabnine
  :ensure t
  :config
  (add-to-list 'company-backends #'company-tabnine))
