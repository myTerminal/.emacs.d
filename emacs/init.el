;;Determine config root path
(defvar mt/config-root
  (file-name-directory load-file-name))

;;Load core.el
(load (expand-file-name "myTerminal/core"
			mt/config-root))

;;Load config files sequentially
(mt/load-file "standard/misc")
(mt/load-file "standard/workstation-variables")
(mt/load-file "standard/packages")
(mt/load-file "standard/file-associations")
(mt/load-file "standard/key-bindings")
(mt/load-file "standard/hooks")
(mt/load-file "_zone-quotes-masseffect")

;;Finish startup
(mt/print-welcome-message)
(mt/load-personalization-variables)
