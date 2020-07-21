;;System
(if (eq system-type
        'darwin)
    (progn
      (add-to-list 'exec-path
                   "/usr/local/bin")
      (add-to-list 'exec-path
                   "~/.cargo/bin")))

;;User
(setq user-full-name
      "Mohammed Ismail Ansari")
(setq user-mail-address
      "team.terminal@gmail.com")

;;Backup
(setq backup-inhibited
      t)
(setq auto-save-default
      nil)

;;Startup
(setq initial-buffer-choice
      t)
(setq initial-scratch-message
      "Welcome myTerminal!\n\n")

;;Interface
(setq frame-title-format
      "%b - emacs")
(setq use-dialog-box
      nil)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq visible-bell
      t)
(set-face-attribute 'mode-line
                    nil
                    :box nil)
(display-battery-mode)

;;Text editing
(column-number-mode)
(electric-pair-mode)
(show-paren-mode)
(global-hl-line-mode -1)
(setq-default indent-tabs-mode
              nil)
(setq-default tab-width
              4)
(set-default 'cursor-type
             'hbar)
(delete-selection-mode 1)
(setq kill-whole-line
      t)
(prefer-coding-system 'utf-8-unix)

;;Spell-check
(let ((path-to-aspell (locate-file "aspell"
                                   exec-path
                                   exec-suffixes
                                   1)))
  (unless (null path-to-aspell)
    (progn
      (add-to-list 'exec-path (file-name-directory path-to-aspell))
      (setq ispell-program-name "aspell")
      (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")))))

;;Package archives and 'customize'
(setq custom-file
      (concat mt/config-root
		      "custom.el"))
(require 'package)
(setq package-user-dir
      (concat mt/config-root
		      "elpa"))
(setq package--init-file-ensured
      t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
             t)
(package-initialize)

;;Fira-Code font ligatures
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)"))))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

;;Misc
(winner-mode t)
(windmove-default-keybindings)
(require 'zone)
(setq zone-programs
      [zone-pgm-quotes])
(setq org-todo-keywords
      '((sequence "DEFERRED(r)" "TODO(t)" "BLOCKED(b)" "IN-PROGRESS(p)" "|"
                  "ALMOST-THERE(a)" "DONE(d)" "CANCELLED(c)" "DELEGATED(g)")))
(setq org-cycle-separator-lines
      1)
