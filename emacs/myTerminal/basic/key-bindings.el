(defvar mt/keyboard-bindings-basic
  '(;; Zoning
    ("C-c `" . zone)
    ("C-c ~" . mt/set-zoning)
    ("C-c !" . zone-leave-me-alone)
    ;; Buffer/Window management
    ("C-x C-b" . ibuffer)
    ("C-x b" . ivy-switch-buffer)
    ("C-x C-f" . counsel-find-file)
    ("C-x C-r" . counsel-recentf)
    ("C-c @" . mt/window-toggle-split-direction)
    ("C-S-<up>" . buf-move-up)
    ("C-S-<down>" . buf-move-down)
    ("C-S-<left>" . buf-move-left)
    ("C-S-<right>" . buf-move-right)
    ("C-c %" . window-shaper-mode)
    ("C-c ;" . ace-window)
    ;; Text-editing
    ("C-}" . mc/mark-next-like-this)
    ("C-{" . mc/mark-previous-like-this)
    ("C-|" . mc/mark-all-like-this)
    ("C-c #" . display-line-numbers-mode)
    ("C-c _" . outer-spaces-mode)
    ("M-/" . undo-tree-visualize)
    ("M-y" . counsel-yank-pop)
    ("M-<down>" . mt/move-line-down)
    ("M-<up>" . mt/move-line-up)
    ("C-<backspace>" . mt/delete-word-backward)
    ("C-c s" . swiper)
    ("C-c ^" . mt/reload-current-file)
    ;; Navigation
    ("C-c j" . avy-goto-char-timer)
    ("C-c k" . avy-goto-word-1)
    ("C-c l" . avy-goto-line)
    ("C-c /" . neotree-toggle)
    ("C-'" . dumb-jump-go)
    ("C-\"" . dumb-jump-back)
    ("C-c C-p s o" . projectile-find-all-occurrences)
    ("C-c C-p s f" . projectile-find-all-references)
    ("M-\\" . wg-reload-session)
    ("C-\\" . wg-switch-to-previous-workgroup)
    ;; Misc
    ("C-c ." . term)
    ("M-x" . counsel-M-x)
    ("C-=" . mt/eval-and-replace)
    ("C-." . emacs-home-show)
    ("C-c e" . quickrun)
    ("C-c r" . quickrun-region)
    ("C-c w" . quickrun-replace-region)))

(mapc 'mt/assign-function-to-keys
      mt/keyboard-bindings-basic)

;; Map-specific key-bindings
(define-key dired-mode-map
  (kbd "C-c |")
  'wdired-change-to-wdired-mode)
