(use-package highlight-indent-guides
  :diminish
  :commands highlight-indent-guides-mode
  :custom
  (highlight-indent-guides-responsive t)
  (highlight-indent-guides-method 'character)
  :hook
  (prog-mode  . highlight-indent-guides-mode)
  )
