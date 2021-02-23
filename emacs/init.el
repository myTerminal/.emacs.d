;; Initialize root
(defvar mt/config-root
  (file-name-directory load-file-name))

(defun mt/start-basic ()
  "Loads basic configs"
  (mt/load-file "basic/misc")
  (mt/load-file "basic/variables")
  (mt/load-file "basic/packages")
  (mt/load-file "basic/file-associations")
  (mt/load-file "basic/key-bindings")
  (mt/load-file "basic/workstation")
  (mt/load-file "basic/hooks"))

(defun mt/start-standard ()
  "Loads standard configs"
  (mt/load-file "standard/misc")
  (mt/load-file "standard/variables")
  (mt/load-file "standard/packages")
  (mt/load-file "standard/file-associations")
  (mt/load-file "standard/key-bindings")
  (mt/load-file "standard/workstation")
  (mt/load-file "standard/hooks"))

(defun mt/start ()
  "Loads core and then conditionally loads configs"
  (load (expand-file-name "myTerminal/core"
			              mt/config-root))
  (mt/start-basic)
  (if (display-graphic-p)
      (mt/start-standard))
  (mt/load-file "_zone-quotes-masseffect")
  (mt/print-welcome-message))

;; Start
(mt/start)
