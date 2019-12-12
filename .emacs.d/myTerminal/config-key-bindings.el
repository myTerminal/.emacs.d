(progn
  (defvar mt/my-keyboard-bindings
    '(;;Zoning
      ("C-~" . mt/set-zoning)
      ("C-!" . zone-leave-me-alone)
      ;;Buffer/Window management
      ("C-x C-b" . ibuffer)
      ("C-x b" . ivy-switch-buffer)
      ("C-x C-f" . counsel-find-file)
      ("C-x C-r" . counsel-recentf)
      ("C-x 7" . mt/window-toggle-split-direction)
      ("C-S-<up>" . buf-move-up)
      ("C-S-<down>" . buf-move-down)
      ("C-S-<left>" . buf-move-left)
      ("C-S-<right>" . buf-move-right)
      ("C-%" . window-shaper-mode)
      ("C-+" . balance-windows)
      ("C-;" . ace-window)
      ;;Text-editing
      ("C-}" . mc/mark-next-like-this)
      ("C-{" . mc/mark-previous-like-this)
      ("C-|" . mc/mark-all-like-this)
      ("C-#" . display-line-numbers-mode)
      ("C-c C-SPC" . outer-spaces-mode)
      ("C-:" . indent-guide-mode)
      ("C-*" . eagle-eye-mode)
      ("M-/" . undo-tree-visualize)
      ("M-y" . counsel-yank-pop)
      ("M-<down>" . mt/move-line-down)
      ("M-<up>" . mt/move-line-up)
      ("C-<backspace>" . mt/delete-word-backward)
      ("C-M-s" . swiper)
      ("C-^" . mt/reload-current-file)
      ;;Navigation
      ("C->" . ace-jump-mode)
      ("C-<" . ace-jump-mode-pop-mark)
      ("C-\," . neotree-toggle)
      ("C-'" . dumb-jump-go)
      ("C-\"" . dumb-jump-back)
      ("C-c C-p s o" . projectile-find-all-occurrences)
      ("C-c C-p s f" . projectile-find-all-references)
      ("C-\\" . wg-switch-to-previous-workgroup)
      ;;Swanking
      ("C-x ~" . sublimity-mode)
      ;;Misc
      ("C-c \\" . wdired-change-to-wdired-mode)
      ("C-c c M-x" . execute-extended-command)
      ("C-c M-x" . smex)
      ("M-x" . counsel-M-x)
      ("C-)" . theme-looper-enable-next-theme)
      ("C-(" . theme-looper-enable-previous-theme)
      ("C-M-'" . myterminal-controls-open-controls)
      ("C-." . emacs-home-show)
      ("C-$" . mt/remove-formatting)
      ("C-=" . mt/eval-and-replace)
      ("C-c e" . quickrun)
      ("C-c r" . quickrun-region)
      ("C-c w" . quickrun-replace-region)))

  (mapc 'mt/assign-function-to-keys
        mt/my-keyboard-bindings))
