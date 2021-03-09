(when (not package-archive-contents)
  (package-refresh-contents))

(defvar mt/packages-basic
  '(;;Text-editing
    multiple-cursors
    company
    undo-tree
    rainbow-mode
    anzu
    ;;Navigation
    dumb-jump
    avy
    ace-window
    workgroups2
    buffer-move
    ibuffer-vc
    ;;Language modes
    markdown-mode
    web-mode
    js2-mode
    less-css-mode
    scss-mode
    sass-mode
    yaml-mode
    vue-mode
    typescript-mode
    rust-mode
    csharp-mode
    ;;Programming tools
    projectile
    column-enforce-mode
    magit
    quickrun
    restclient
    ;;File-system
    ranger
    neotree
    ztree
    ;;Super-powers
    which-key
    counsel
    counsel-projectile
    ivy-hydra
    ;;Networking tools
    mew
    jabber
    ;;Misc
    delight
    golden-ratio
    volume
    quelpa
    marmalade-client))

(mapc (lambda (p)
        (unless (package-installed-p p)
          (package-install p)))
      mt/packages-basic)

(setq quelpa-update-melpa-p
      nil)

(quelpa '(prompt-you :fetcher github
                     :repo "myTerminal/prompt-you"))
(quelpa '(emacs-visual-notifications :fetcher github
                                     :repo "myTerminal/emacs-visual-notifications"))
(quelpa '(eagle-eye :fetcher github
                    :repo "myTerminal/eagle-eye"))
(quelpa '(outer-spaces :fetcher github
                       :repo "myTerminal/outer-spaces"))
(quelpa '(emacs-sounds :fetcher github
                       :repo "myTerminal/emacs-sounds"))
(quelpa '(emacs-profiles :fetcher github
                         :repo "myTerminal/emacs-profiles"))
(quelpa '(emacs-daily-events :fetcher github
                             :repo "myTerminal/emacs-daily-events"))
(quelpa '(emacs-home :fetcher github
                     :repo "myTerminal/emacs-home"))
(quelpa '(zone-quotes :fetcher github
                      :repo "myTerminal/zone-quotes"))
(quelpa '(zone-tunnels :fetcher github
                       :repo "myTerminal/zone-tunnels"))
(quelpa '(emacs-new-buffer :fetcher github
                           :repo "myTerminal/emacs-new-buffer"))
(quelpa '(window-shaper :fetcher github
                        :repo "myTerminal/window-shaper"))
(quelpa '(projectile-extras :fetcher github
                            :repo "myTerminal/projectile-extras"))

(global-undo-tree-mode)

(global-anzu-mode +1)

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

(setq emacs-sounds-bell-sound
      (concat mt/config-root
              "sounds/bell.wav"))
(setq emacs-sounds-find-file-sound
      (concat mt/config-root
              "sounds/file-change.wav"))
(setq emacs-sounds-window-change-sound
      (concat mt/config-root
              "sounds/window-change.wav"))

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
