(defvar mt/keyboard-bindings-standard
  '(;;Swanking
    ("C-c &" . sublimity-mode)
    ;;Misc
    ("C-c )" . theme-looper-enable-next-theme)
    ("C-c (" . theme-looper-enable-previous-theme)))

(mapc 'mt/assign-function-to-keys
      mt/keyboard-bindings-standard)
