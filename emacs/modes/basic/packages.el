(defvar mt/packages-basic
  '(;; Text-editing
    (multiple-cursors github "magnars/multiple-cursors.el" t)
    (company github "company-mode/company-mode" t)
    (undo-tree github "akhayyat/emacs-undo-tree" nil ("undo-tree.el"))
    (rainbow-mode github "emacsmirror/rainbow-mode" nil)
    (anzu github "emacsorphanage/anzu" t)
    (yasnippet github "joaotavora/yasnippet" t)
    (outer-spaces github "myTerminal/outer-spaces" nil)
    ;; Navigation
    (dumb-jump github "jacktasia/dumb-jump" t)
    (avy github "abo-abo/avy" t)
    (ace-window github "abo-abo/ace-window" t)
    (perspective github "nex3/perspective-el" t)
    (buffer-move github "lukhas/buffer-move" t)
    (window-shaper github "myTerminal/window-shaper" nil)
    ;; Language modes
    (markdown-mode github "jrblevin/markdown-mode" t)
    (web-mode github "fxbois/web-mode" t)
    (js2-mode github "mooz/js2-mode" t)
    (less-css-mode github "purcell/less-css-mode" t)
    (scss-mode github "antonj/scss-mode" t)
    (sass-mode github "nex3/sass-mode" t)
    (yaml-mode github "yoshiki/yaml-mode" t)
    (vue-mode github "AdamNiederer/vue-mode" t)
    (typescript-mode github "emacs-typescript/typescript.el" t)
    (rust-mode github "rust-lang/rust-mode" t)
    (csharp-mode github "emacs-csharp/csharp-mode" t)
    ;; Programming tools
    (slime github "slime/slime" t ("*"))
    (projectile github "bbatsov/projectile" t)
    (counsel-projectile github "ericdanan/counsel-projectile" t)
    (projectile-extras github "myTerminal/projectile-extras" nil)
    (column-enforce-mode github "jordonbiondo/column-enforce-mode" nil)
    (magit github "magit/magit" t ("lisp/*.el"))
    (quickrun github "emacsorphanage/quickrun" t)
    (restclient github "pashky/restclient.el")
    ;; File-system
    (dired-narrow github "Fuco1/dired-hacks" nil)
    (dired-subtree github "Fuco1/dired-hacks" nil)
    (dired-ranger github "Fuco1/dired-hacks" nil)
    (ztree github "fourier/ztree" nil)
    ;; Super-powers
    (which-key github "justbur/emacs-which-key" t)
    (counsel github "abo-abo/swiper" t ("counsel.el"))
    (key-chord github "emacsorphanage/key-chord" nil)
    (hydra github "abo-abo/hydra" t)
    ;; Networking tools
    (mew github "kazu-yamamoto/Mew" t ("elisp/*.el"))
    ;; Misc
    (dim github "alezost/dim.el" t)
    (golden-ratio github "roman/golden-ratio.el" t)
    (volume github "dbrock/volume.el" nil)
    (zone-quotes github "myTerminal/zone-quotes" nil)
    ))

(mapc 'mt/install-package-with-quelpa
      mt/packages-basic)

(setq quelpa-update-melpa-p
      nil)

(global-undo-tree-mode)

(global-anzu-mode +1)

(setq yas-snippet-dirs (list (concat mt/base-path
                                     "snippets")))
(yas-global-mode 1)
(add-hook 'yas-minor-mode
          (lambda ()
            (yas-activate-extra-mode 'fundamental-mode)))

(dumb-jump-mode)

(customize-set-variable 'persp-mode-prefix-key
                        (kbd "M-z"))
(customize-set-variable 'persp-state-default-file
                        (concat mt/config-root
                                "persp-session-file"))
(customize-set-variable 'persp-modestring-short
                        t)
(persp-mode)

(setq inferior-js-program-command
      "node --interactive")

(autoload 'markdown-mode
  "markdown-mode"
  "Major mode for editing Markdown files"
  t)

(setq inferior-lisp-program
      (executable-find "sbcl"))

(if (eq system-type
        'windows-nt)
    (setq projectile-indexing-method
          'alien))
(setq projectile-mode-line
      '(:eval (format " Project:%s"
                      (projectile-project-name))))
(projectile-mode)
(define-key projectile-mode-map
  (kbd "C-\\")
  'projectile-command-map)

(key-chord-mode 1)

(which-key-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers
      t)
(setq projectile-completion-system
      'ivy)
(counsel-projectile-mode)

(dim-minor-names '((undo-tree-mode nil undo-tree)
                   (anzu-mode nil anzu)
                   (projectile-mode nil projectile)
                   (company-mode " a_ " company)
                   (which-key-mode nil which-key)
                   (outer-spaces-mode nil outer-spaces)
                   (flyspell-mode " Aa" flyspell)
                   (eldoc-mode nil eldoc)
                   (fira-code-mode " i++" fira-code-mode)
                   (buffer-face-mode nil face-remap)
                   (hi-lock-mode nil hi-lock)
                   (yas-minor-mode nil yasnippet)
                   (ivy-mode nil ivy)))
