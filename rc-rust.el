(setenv "PATH"
	(concat "/home/lsv/.cargo/bin" ":" (getenv "PATH")))

(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))


(add-hook 'rust-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (setq tab-width 4)
	    (setq rust-indent-offset 4)))

(setq racer-rust-src-path "/home/lsv/soft/rust/src")
(setq racer-cmd "/home/lsv/.cargo/bin/racer")

(add-hook 'rust-mode-hook #'racer-activate)
(eval-after-load "rust-mode" '(require 'racer))

(add-hook 'rust-mode-hook 'flycheck-mode)
(add-hook 'rust-mode-hook 'racer-mode)
(add-hook 'racer-mode-hook 'eldoc-mode)
(add-hook 'racer-mode-hook 'company-mode)


(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


;;general compile function call "make all"
(defun rust-save-and-make-all ()
  "save and call compile as make all"
  (interactive)
  (save-buffer)
  (compile "cargo build")
  (message "cargo build executed!"))

(defun rust-save-and-test-all ()
  "save and call compile as make all"
  (interactive)
  (save-buffer)
  (compile "cargo test")
  (message "cargo test  executed!"))

(global-set-key (kbd "C-b") 'rust-save-and-make-all)
(global-set-key (kbd "C-t") 'rust-save-and-test-all)
