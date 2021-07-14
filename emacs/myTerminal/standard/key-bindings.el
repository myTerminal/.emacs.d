(defvar mt/keyboard-bindings-standard
  '(;; Swanking
    ("C-c &" . sublimity-mode)
    ;; Misc
    ("C-(" . eagle-eye-zoom-out)
    ("C-)" . eagle-eye-zoom-in)
    ("C-c )" . theme-looper-enable-next-theme)
    ("C-c (" . theme-looper-enable-previous-theme)))

(mapc 'mt/assign-function-to-keys
      mt/keyboard-bindings-standard)
