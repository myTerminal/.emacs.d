;;; Hydras

(defhydra mt/hydra-toggles (:color pink)
  "
_l_ line-numbers:  %`display-line-numbers-mode
_SPC_ outer-spaces:  %`outer-spaces-mode

"
  ("l" display-line-numbers-mode nil)
  ("SPC" outer-spaces-mode nil)
  ("q" nil "Cancel"))

(defhydra mt/hydra-misc (:color blue)
  "Misc"
  ("z" mt/set-zoning "Enable zoning")
  ("x" zone-leave-me-alone "Disable zoning")
  ("r" window-shaper-mode "Resize windows")
  ("." neotree-toggle "neotree")
  ("/" term "Terminal")
  ("i" mt/prompt-to-connect-to-irc "Connect to IRC")
  ("," emacs-home-show "emacs-home")
  ("q" nil "Cancel"))

(defhydra mt/hydra-editing (:color blue)
  "Text"
  ;; Programming
  ("'" dumb-jump-go "Go to definition")
  ("\"" dumb-jump-back "Back from definition")
  ;; Jumping
  ("k" avy-goto-char-timer "Jump to char")
  ("j" avy-goto-word-1 "Jump to word")
  ("l" avy-goto-line "Jump to line")
  ;; Searching
  ("s" projectile-find-all-occurrences "Search for occurrences")
  ("r" projectile-find-all-references "Search for references")
  ;; Misc
  ("r" mt/reload-current-file "Reload file")
  ("q" nil "Cancel"))

(defhydra mt/hydra-windows ()
  "Buffers and Windows"
  ;; Moving
  ("<up>" windmove-up "^")
  ("<down>" windmove-down "v")
  ("<left>" windmove-left "<")
  ("<right>" windmove-right ">")
  ("S-<up>" buf-move-up "Move up")
  ("S-<down>" buf-move-down "Move down")
  ("S-<left>" buf-move-left "Move left")
  ("S-<right>" buf-move-right "Move right")
  ;; Arranging
  ("+" mt/window-toggle-split-direction "Horizontal<>Vertical")
  ;; Jumping
  ("\\" ace-window "Jump to window" :color blue)
  ;; Misc
  ("q" nil "Cancel"))

;;; Key-chords

(key-chord-define-global "``" 'mt/hydra-toggles/body)
(key-chord-define-global "[[" 'mt/hydra-misc/body)
(key-chord-define-global "]]" 'mt/hydra-editing/body)
(key-chord-define-global "\\\\" 'mt/hydra-windows/body)

;;; Regular key-bindings

(mt/bind-keys '(
                ;; Buffer/Window management
                ("C-x C-b" . ibuffer)
                ("C-x b" . ivy-switch-buffer)
                ("C-c p" . mt/switch-to-previous-buffer)
                ("C-c b" . ivy-push-view)
                ("C-x C-f" . counsel-find-file)
                ("C-x C-r" . counsel-recentf)
                ("C-x k" . mt/kill-this-buffer)
                ;; Text-editing
                ("C-|" . undo-tree-visualize)
                ("M-%" . anzu-query-replace)
                ("C-}" . mc/mark-next-like-this)
                ("C-{" . mc/mark-previous-like-this)
                ("C-\"" . mc/mark-all-like-this)
                ("M-y" . counsel-yank-pop)
                ("M-<down>" . mt/move-line-down)
                ("M-<up>" . mt/move-line-up)
                ("C-<backspace>" . mt/delete-word-backward)
                ("C-c s" . swiper)
                ;; Misc
                ("C-=" . mt/eval-and-replace)
                ("M-x" . counsel-M-x))
              global-map)

(mt/bind-keys '(
                ;; dired-narrow
                ("/" . dired-narrow-fuzzy)
                ;; dired-subtree
                ("]" . dired-subtree-toggle)
                ("[" . dired-subtree-cycle)
                ("C-<up>" . dired-subtree-beginning)
                ("C-<down>" . dired-subtree-end)
                ("C-<left>" . dired-subtree-up)
                ("C-<right>" . dired-subtree-down)
                ("M-<up>" . dired-subtree-previous-sibling)
                ("M-<down>" . dired-subtree-next-sibling)
                ("M-<right>" . dired-subtree-mark-subtree)
                ("M-<left>" . dired-subtree-unmark-subtree)
                ;; dired-ranger
                ("M-c" . dired-ranger-copy)
                ("M-m" . dired-ranger-move)
                ("M-v" . dired-ranger-paste))
              dired-mode-map)

(mt/bind-keys '(
                ;; quickrun
                ("C-c e" . quickrun)
                ("C-c r" . quickrun-region)
                ("C-c t" . quickrun-replace-region))
              prog-mode-map)
