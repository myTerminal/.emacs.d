(add-hook 'prog-mode-hook
          'fira-code-mode)

(add-hook 'text-mode-hook
          (lambda () (setq line-spacing 10)))
