;; function.el
;;Toggle between saved positions as in MIM editor
(defun save-point-and-switch ()
  "Save current point to register 0 and go to the previously saved position"
 (interactive)
 (let (temp)
   (setq temp (point-marker))
   (when (not (equal (get-register 0) nil))
     (jump-to-register 0))
   (set-register 0 temp)))

;;Save current position to register 0
(defun save-point-only ()
 "Save current point to register 0"
 (interactive)
 (set-register 0 (point-marker)))

;;general compile function call "make all"
(defun user-save-and-make-all ()
  "save and call compile as make all"
  (interactive)
  (save-buffer)
  (compile "make -j1")
  (message "make all executed!"))

;;general compile function call "scons"
(defun user-save-and-scons-all ()
  "save and call compile as make all"
  (interactive)
  (save-buffer)
  (compile "scons -u -j7")
  (message "scons all executed!"))

;;general compile function call "gmake all"
(defun user-save-and-gmake-all ()
  "save and call shell command: gmake all"
  (interactive)
  (save-buffer)
  (compile "gmake -j1 all")
  (message "gmake all executed!"))

;;general compile function call "make clean"
(defun user-save-and-make-clean ()
  "save and call compile as make all"
  (interactive)
  (save-buffer)
  (compile "make -j7 clean")
  (message "scons all executed!"))

;;general compile function call "make clean"
(defun user-save-and-scons-clean ()
  "save and call compile as make all"
  (interactive)
  (save-buffer)
  (compile "scons -u -j7 -c")
  (message "scons all executed!"))

;;general compile function call "make test"
(defun user-make-test ()
  "save and call compile as make all"
  (interactive)
  (save-buffer)
  (compile "make test")
  (message "make test executed!"))


(defun reload-buffer ()
  "save and reload buffer"
  (interactive)
  (save-buffer)
  (let ((fname (buffer-file-name))
	(bname (buffer-name)))
    (kill-buffer bname)
    (find-file  fname)))

;; (defun run-perl()
;;   "run perl buffer"
;;   (interactive)
;;   (setq perl_fn 
;; 	(concat "xterm -fg yellow -bg black -e " (buffer-file-name))
;; 	)
;;   (shell-command perl_fn))

(defun duplicate-line (&optional commentfirst)
  "comment line at point; if COMMENTFIRST is non-nil, comment the original" 
  (interactive)
  (beginning-of-line)
  (push-mark)
  (end-of-line)
  (let ((str (buffer-substring (region-beginning) (region-end))))
    (when commentfirst
    (comment-region (region-beginning) (region-end)))
    (insert-string
      (concat (if (= 0 (forward-line 1)) "" "\n") str "\n"))
    (forward-line -1)))
