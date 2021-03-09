(when (not package-archive-contents)
  (package-refresh-contents))

(defvar mt/packages-standard
  '(;; Text-editing
    sublimity
    ;; Language modes
    latex-preview-pane
    ;; Programming tools
    diff-hl
    minimap
    skewer-mode
    ;; Color themes
    material-theme
    hemisu-theme
    green-phosphor-theme
    overcast-theme
    ;; Visual tweaks
    telephone-line
    fira-code-mode
    theme-looper))

(mapc (lambda (p)
        (unless (package-installed-p p)
          (package-install p)))
      mt/packages-standard)

(require 'sublimity-scroll)

(global-diff-hl-mode)

(require 'telephone-line)
(setq telephone-line-lhs
      '((evil   . (telephone-line-misc-info-segment))
        (accent . (telephone-line-buffer-segment
                   telephone-line-workgroups2-segment))
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
