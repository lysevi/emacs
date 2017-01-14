;; keybindings.el

(global-set-key [f1] 'user-save-and-make-all)
;(global-set-key [f2] 'isearch-forward)
(global-set-key [f2] 'user-save-and-scons-all)
(global-set-key [f3] 'query-replace-regexp)
(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [f4] 'eshell)
(global-set-key [f8] 'indent-region)
(global-set-key [f9] 'comment-region)
(global-set-key [f10] 'uncomment-region)
(global-set-key [f11] 'previous-error)
(global-set-key [f12] 'next-error)

(global-set-key (kbd "C-p") 'previous-line)

(global-set-key [kp-enter] 'newline-and-indent)

(global-set-key (kbd "\ep")   'complete-symbol)
(global-set-key (kbd "\e\eg") 'user-save-and-gmake-all)
(global-set-key (kbd "\e\ec") 'user-save-and-make-clean)
(global-set-key (kbd "\e\es") 'user-save-and-scons-clean)
(global-set-key (kbd "\e\et") 'user-make-test)
(global-set-key (kbd "\e\ep") 'gtags-find-pattern)
(global-set-key (kbd "\e\ei") 'ispell-buffer)

;(global-set-key (kbd "C-c e") 'slime-eval-buffer)
;(global-set-key (kbd "\e\es n") 'slime-list-compiler-notes)
;(global-set-key (kbd "\e\ex") 'ahg-status)
;(global-set-key (kbd "\e\ed") 'ahg-diff)
(global-set-key (kbd "\e\ex") 'magit-status)
(global-set-key (kbd "\e\ek") 'kill-compilation)
(global-set-key (kbd "\e\el") 'goto-line)
;(global-set-key (kbd "\e\e/") 'save-point-and-switch)
;(global-set-key (kbd "\e\e?") 'save-point-only)
(global-set-key [mouse-3]      'imenu)
(global-set-key (kbd "C-x C-b")      'ibuffer)
(global-set-key (kbd "C-x C-i")      'latex-insert-block)
(global-set-key [(meta right)] 'tabbar-forward)
(global-set-key [(meta left)] 'tabbar-backward)
;(global-set-key (kbd "\e\ew")   'semantic-ia-complete-symbol)

(global-set-key (kbd "C-c r") 'reload-buffer)

(global-set-key (kbd "C-c y") 'duplicate-line)

;; duplicate a line and comment the first
(global-set-key (kbd "C-c t") (lambda()(interactive)(duplicate-line t)))
