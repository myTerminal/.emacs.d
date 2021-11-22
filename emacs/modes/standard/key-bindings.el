;;; Regular key-bindings

(mt/bind-keys '(
                ;; Swanking
                ("C-c &" . sublimity-mode)
                ;; Misc
                ("C-(" . eagle-eye-zoom-out)
                ("C-)" . eagle-eye-zoom-in)
                ("C-c )" . theme-looper-enable-next-theme)
                ("C-c (" . theme-looper-enable-previous-theme))
              global-map)
