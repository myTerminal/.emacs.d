;;; Regular key-bindings

(mt/bind-keys '(
                ;; Misc
                ("C-c o" . eagle-eye-zoom-out)
                ("C-c i" . eagle-eye-zoom-in)
                ("C-c )" . theme-looper-enable-next-theme)
                ("C-c (" . theme-looper-enable-previous-theme))
              global-map)
