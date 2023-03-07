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

(add-to-list 'default-frame-alist
             `(font . ,mt/variable/font-default))

(set-frame-size (selected-frame)
                (car mt/variable/frame-dimensions)
                (cdr mt/variable/frame-dimensions))
