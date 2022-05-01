(defvar mt/packages-standard
  '(;; Text-editing
    (eagle-eye github "myTerminal/eagle-eye" nil)
    ;; Language modes
    (latex-preview-pane github "jsinglet/latex-preview-pane" nil)
    ;; Programming tools
    (diff-hl github "dgutov/diff-hl" t)
    (skewer-mode github "skeeto/skewer-mode" t)
    ;; Color themes
    (material-theme github "cpaulik/emacs-material-theme" t)
    (hemisu-theme github "andrzejsliwa/hemisu-theme" nil)
    (green-phosphor-theme github "aalpern/emacs-color-theme-green-phosphor" nil)
    (overcast-theme github "myTerminal/overcast-theme" nil)
    ;; Visual tweaks
    (telephone-line github "dbordak/telephone-line" nil)
    (fira-code-mode github "jming422/fira-code-mode" nil)
    (theme-looper github "myTerminal/theme-looper" nil)
    ))

(mapc 'mt/install-package-with-quelpa
      mt/packages-standard)

(global-diff-hl-mode)

(require 'telephone-line)
(setq telephone-line-lhs
      '((evil   . (telephone-line-misc-info-segment))
        (accent . (telephone-line-buffer-segment))
        (nil    . (telephone-line-minor-mode-segment))))
(setq telephone-line-rhs
      '((nil    . (telephone-line-process-segment
                   telephone-line-vc-segment
                   telephone-line-erc-modified-channels-segment))
        (accent . (telephone-line-major-mode-segment))
        (evil   . (telephone-line-airline-position-segment))))
(setq telephone-line-primary-left-separator
      telephone-line-gradient)
(setq telephone-line-primary-right-separator
      telephone-line-gradient)
(telephone-line-mode t)

(theme-looper-set-favorite-themes '(overcast
                                    material
                                    green-phosphor
                                    hemisu-dark
                                    leuven))
