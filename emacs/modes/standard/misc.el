;; Interface
(setq frame-title-format
      "%b - emacs")
(setq use-dialog-box
      nil)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq visible-bell
      t)
(set-face-attribute 'mode-line
                    nil
                    :box nil)
(setq org-pretty-entities t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width '(640))
