(defvar mt/packages-basic
  '(;; Text-editing
    (multiple-cursors melpa "magnars/multiple-cursors.el" t)
    (company melpa "company-mode/company-mode" t)
    (undo-tree-0.7.5 url "https://elpa.gnu.org/packages/undo-tree-0.7.5.el" t)
    (rainbow-mode-1.0.5 url "https://elpa.gnu.org/packages/rainbow-mode-1.0.5.el" t)
    (anzu melpa "emacsorphanage/anzu" t)
    (yasnippet melpa "joaotavora/yasnippet" t)
    (outer-spaces github "myTerminal/outer-spaces" nil)
    ;; Navigation
    (dumb-jump melpa "jacktasia/dumb-jump" t)
    (avy melpa "abo-abo/avy" t)
    (ace-window melpa "abo-abo/ace-window" t)
    (workgroups2 melpa "pashinin/workgroups2" t)
    (buffer-move melpa "lukhas/buffer-move" t)
    (ibuffer-vc melpa "purcell/ibuffer-vc" t)
    (window-shaper github "myTerminal/window-shaper" nil)
    ;; Language modes
    (markdown-mode melpa "jrblevin/markdown-mode" t)
    (web-mode melpa "fxbois/web-mode" t)
    (js2-mode melpa "mooz/js2-mode" t)
    (less-css-mode melpa "purcell/less-css-mode" t)
    (scss-mode melpa "antonj/scss-mode" t)
    (sass-mode melpa "nex3/sass-mode" t)
    (yaml-mode melpa "yoshiki/yaml-mode" t)
    (vue-mode melpa "AdamNiederer/vue-mode" t)
    (typescript-mode melpa "emacs-typescript/typescript.el" t)
    (rust-mode melpa "rust-lang/rust-mode" t)
    (csharp-mode melpa "emacs-csharp/csharp-mode" t)
    ;; Programming tools
    (projectile melpa "bbatsov/projectile" t)
    (counsel-projectile melpa "ericdanan/counsel-projectile" t)
    (projectile-extras github "myTerminal/projectile-extras" nil)
    (column-enforce-mode melpa "jordonbiondo/column-enforce-mode" nil)
    (magit melpa "magit/magit" t)
    (quickrun melpa "emacsorphanage/quickrun" t)
    (restclient melpa "pashky/restclient.el")
    ;; File-system
    (ranger melpa "ralesi/ranger" t)
    (neotree melpa "jaypei/emacs-neotree" t)
    (ztree melpa "fourier/ztree" nil)
    ;; Super-powers
    (which-key melpa "justbur/emacs-which-key" t)
    (counsel melpa "abo-abo/swiper" t)
    (hydra melpa "abo-abo/hydra" t)
    ;; Networking tools
    (mew melpa "kazu-yamamoto/Mew" t)
    ;; Misc
    (delight-1.7 url "https://elpa.gnu.org/packages/delight-1.7.el" t)
    (golden-ratio melpa "roman/golden-ratio.el" t)
    (volume melpa "dbrock/volume.el" nil)
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

(global-undo-tree-mode)

(global-anzu-mode +1)

(setq yas-snippet-dirs (list (concat mt/base-path
                                     "snippets")))
(yas-global-mode 1)
(add-hook 'yas-minor-mode
          (lambda ()
            (yas-activate-extra-mode 'fundamental-mode)))

(dumb-jump-mode)

(setq wg-prefix-key
      (kbd "M-z"))
(setq wg-session-file
      (concat mt/config-root
		      "workgroups2-session-file"))
(setq wg-session-load-on-start nil
      wg-workgroups-mode-exit-save-behavior 'ask
      wg-emacs-exit-save-behavior 'ask
      wg-mode-line-display-on t
      wg-flag-modified t
      wg-mode-line-decor-left-brace "{"
      wg-mode-line-decor-right-brace "}"
      wg-mode-line-decor-divider ":")
(workgroups-mode 1)

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

(which-key-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers
      t)
(setq projectile-completion-system
      'ivy)
(counsel-projectile-mode)

(emacs-daily-events-global-mode)

(delight '((anzu-mode nil
                      anzu)
           (undo-tree-mode nil
                           undo-tree)
           (company-mode nil
                         company)
           (which-key-mode nil
                           which-key)
           (workgroups-mode nil
                            workgroups2)
           (emacs-daily-events-global-mode " (!)"
                                           emacs-daily-events)
           (outer-spaces-mode " _a_"
                              outer-spaces)
           (flyspell-mode " Aa"
                          flyspell)
           (eldoc-mode nil
                       eldoc)
           (buffer-face-mode nil
                             face-remap)
           (hi-lock-mode nil
                         hi-lock)))
