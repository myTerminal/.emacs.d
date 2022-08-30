(defvar mt/packages-basic
  '(;; Text-editing
    (multiple-cursors github "magnars/multiple-cursors.el" t)
    (company github "company-mode/company-mode" t)
    (anzu github "emacsorphanage/anzu" t)
    (yasnippet github "joaotavora/yasnippet" t)
    (outer-spaces github "myTerminal/outer-spaces" nil)
    ;; Navigation
    (dumb-jump github "jacktasia/dumb-jump" t)
    (avy github "abo-abo/avy" t)
    (ace-window github "abo-abo/ace-window" t)
    (perspective github "nex3/perspective-el" t)
    (buffer-move github "lukhas/buffer-move" t)
    (ibuffer-vc github "purcell/ibuffer-vc" t)
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
    (ranger github "ralesi/ranger" t)
    (neotree github "jaypei/emacs-neotree" t)
    (ztree github "fourier/ztree" nil)
    ;; Super-powers
    (which-key github "justbur/emacs-which-key" t)
    (counsel github "abo-abo/swiper" t ("counsel.el"))
    (key-chord github "emacsorphanage/key-chord" nil)
    (hydra github "abo-abo/hydra" t)
    ;; Networking tools
    (mew github "kazu-yamamoto/Mew" t)
    ;; Misc
    (dim github "alezost/dim.el" t)
    (golden-ratio github "roman/golden-ratio.el" t)
    (volume github "dbrock/volume.el" nil)
    (emacs-visual-notifications github "myTerminal/emacs-visual-notifications" nil)
    (emacs-daily-events github "myTerminal/emacs-daily-events" nil)
    (emacs-home github "myTerminal/emacs-home" nil)
    (zone-quotes github "myTerminal/zone-quotes" nil)
    (zone-tunnels github "myTerminal/zone-tunnels" nil)
    (marmalade-client github "nicferrier/emacs-marmalade-upload" nil)
    ))

(mapc 'mt/install-package-with-quelpa
      mt/packages-basic)

(setq quelpa-update-melpa-p
      nil)

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

(setq ibuffer-formats
      '((mark
         " "
         read-only
         " "
         modified
         " "
         (name 18 18 :left :elide)
         " "
         (vc-status 16 16 :left)
         " "
         (size 9 -1 :right)
         " "
         (mode 16 16 :left :elide)
         " "
         filename-and-process)))

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
(setq projectile-switch-project-action
      (lambda ()
        (cond ((and (fboundp 'neo-global--window-exists-p)
                    (neo-global--window-exists-p))
               (neotree-projectile-action))
              (t (counsel-projectile)))))
(setq projectile-mode-line
      '(:eval (format " Project:%s"
                      (projectile-project-name))))
(projectile-mode)
(define-key projectile-mode-map
  (kbd "C-c C-p")
  'projectile-command-map)

(key-chord-mode 1)

(which-key-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers
      t)
(setq projectile-completion-system
      'ivy)
(counsel-projectile-mode)

(emacs-daily-events-global-mode)

(dim-minor-names '((anzu-mode nil anzu)
                   (projectile-mode nil projectile)
                   (company-mode " a_ " company)
                   (which-key-mode nil which-key)
                   (emacs-daily-events-global-mode " (!)" emacs-daily-events)
                   (outer-spaces-mode nil outer-spaces)
                   (flyspell-mode " Aa" flyspell)
                   (eldoc-mode nil eldoc)
                   (fira-code-mode " i++" fira-code-mode)
                   (buffer-face-mode nil face-remap)
                   (hi-lock-mode nil hi-lock)
                   (yas-minor-mode nil yasnippet)
                   (ivy-mode nil ivy)))
