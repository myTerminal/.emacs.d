(add-hook 'prog-mode-hook
          'fira-code-mode)

(add-hook 'text-mode-hook
          (lambda () (setq line-spacing 10)))

(add-hook 'prog-mode-hook
          (lambda ()
            (setq buffer-face-mode-face `(:family ,mt/variable/font-family-for-programming))
            (buffer-face-mode)))
