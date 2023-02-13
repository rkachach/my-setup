
(with-eval-after-load "magit-diff"
  ;; Swap the meanings of RET and C-RET on diff hunks.
  ;; Note that the default RET bindings are [remap magit-visit-thing]
  ;; in the original keymaps, but I am only concerned with RET here.
  ;; Note also that in a terminal, C-RET sends C-j.
  ;; Using the same key formats here as magit-diff.el
  (define-key magit-file-section-map [return] 'magit-diff-visit-file-worktree)
  (define-key magit-file-section-map [C-return] 'magit-diff-visit-file)
  (define-key magit-file-section-map (kbd "C-j") 'magit-diff-visit-file)
  (define-key magit-hunk-section-map [return] 'magit-diff-visit-file-worktree)
  (define-key magit-hunk-section-map [C-return] 'magit-diff-visit-file)
  (define-key magit-hunk-section-map (kbd "C-j") 'magit-diff-visit-file))
