(defvar mt/packages-standard
  '(;; Text-editing
    (sublimity melpa "zk-phi/sublimity" t)
    (minimap-1.4 url "https://elpa.gnu.org/packages/minimap-1.4.el" t)
    (eagle-eye github "myTerminal/eagle-eye" nil)
    ;; Language modes
    (latex-preview-pane melpa "jsinglet/latex-preview-pane" nil)
    ;; Programming tools
    (diff-hl melpa "dgutov/diff-hl" t)
    (skewer-mode melpa "skeeto/skewer-mode" t)
    ;; Color themes
    (material-theme melpa "cpaulik/emacs-material-theme" t)
    (hemisu-theme melpa "andrzejsliwa/hemisu-theme" nil)
    (green-phosphor-theme melpa "aalpern/emacs-color-theme-green-phosphor" nil)
    (overcast-theme melpa "myTerminal/overcast-theme" nil)
    ;; Visual tweaks
    (telephone-line melpa "dbordak/telephone-line" t)
    (fira-code-mode melpa "jming422/fira-code-mode" nil)
    (theme-looper melpa "myTerminal/theme-looper" nil)
    ))

(mapc 'mt/install-package-with-quelpa
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
