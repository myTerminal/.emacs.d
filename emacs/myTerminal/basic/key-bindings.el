(defvar mt/keyboard-bindings-basic
  '(
    ;; Buffer/Window management
    ("C-x C-b" . ibuffer)
    ("C-x b" . ivy-switch-buffer)
    ("C-x C-f" . counsel-find-file)
    ("C-x C-r" . counsel-recentf)
    ;; Text-editing
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
    ("M-x" . counsel-M-x)))

(mapc 'mt/assign-function-to-keys
      mt/keyboard-bindings-basic)

;; Map-specific key-bindings
(define-key dired-mode-map
  (kbd "C-c |")
  'wdired-change-to-wdired-mode)
(define-key prog-mode-map
  (kbd "C-c e")
  'quickrun)
(define-key prog-mode-map
  (kbd "C-c r")
  'quickrun-region)
(define-key prog-mode-map
  (kbd "C-c t")
  'quickrun-replace-region)

;;; Hydras

(defhydra mt/hydra-toggles (:color pink)
  "
_l_ line-numbers:  %`display-line-numbers-mode
_SPC_ outer-spaces:  %`outer-spaces-mode

"
  ("l" display-line-numbers-mode nil)
  ("SPC" outer-spaces-mode nil)
  ("q" nil "Cancel"))

(defhydra mt/hydra-tools (:color blue)
  "Tools"
  ;; Zoning
  ("z" mt/set-zoning "Enable zoning")
  ("x" zone-leave-me-alone "Disable zoning")
  ;; Misc
  ("\\" neotree-toggle "neotree")
  ("/" term "Terminal")
  ("." emacs-home-show "emacs-home")
  ("%" window-shaper-mode "Resize windows")
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
  ("/" undo-tree-visualize "Undo tree")
  ("^" mt/reload-current-file "Reload file")
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
  ;; Workspaces
  ("M-\\" wg-reload-session "Restore workspaces" :color blue)
  ("C-\\" wg-switch-to-previous-workgroup "Switch workspace" :color blue)
  ;; Misc
  ("q" nil "Cancel"))

(global-set-key (kbd "C-`") 'mt/hydra-toggles/body)
(global-set-key (kbd "C-<") 'mt/hydra-tools/body)
(global-set-key (kbd "C->") 'mt/hydra-editing/body)
(global-set-key (kbd "C-|") 'mt/hydra-windows/body)
