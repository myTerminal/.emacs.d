(theme-looper-enable-theme mt/variable/color-theme)
(add-to-list 'default-frame-alist
             `(font . ,mt/variable/font-default))
(add-hook 'prog-mode-hook
          (lambda ()
            (setq buffer-face-mode-face `(:family ,mt/variable/font-family-for-programming))
            (buffer-face-mode)))
(set-frame-size (selected-frame)
                (car mt/variable/frame-dimensions)
                (cdr mt/variable/frame-dimensions))
