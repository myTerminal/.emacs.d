(require 'cl-lib)

;; Initialize root
(defvar mt/config-root
  (file-name-directory load-file-name))

(defun mt/start ()
  "Loads core and then conditionally loads configs"
  (cl-flet* ((start-basic ()
                          (mt/load-file "modes/basic/misc")
                          (mt/load-file "modes/basic/packages")
                          (mt/load-file "modes/basic/file-associations")
                          (mt/load-file "modes/basic/key-bindings")
                          (mt/load-file "modes/basic/hooks"))
             (start-standard ()
                             (mt/load-file "modes/standard/misc")
                             (mt/load-file "modes/standard/variables")
                             (mt/load-file "modes/standard/packages")
                             (mt/load-file "modes/standard/file-associations")
                             (mt/load-file "modes/standard/key-bindings")
                             (mt/load-file "modes/standard/workstation")
                             (mt/load-file "modes/standard/hooks")))
    (load (expand-file-name "core"
			                mt/config-root))
    (start-basic)
    (if (display-graphic-p)
        (start-standard))
    (mt/print-welcome-message)))

;; Start
(mt/start)
