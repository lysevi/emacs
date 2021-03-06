(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (tango-dark)))
 '(default-input-method "cyrillic-jcuken")
 '(delete-selection-mode nil)
 '(desktop-load-locked-desktop t)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(eshell-kill-on-exit t)
 '(git-committer-email "lysevi@gmail.com")
 '(git-committer-name "Sergey Lyubimov")
 '(global-font-lock-mode t nil (font-lock))
 '(ls-lisp-dirs-first t)
 '(magit-save-some-buffers (quote dontask))
 '(mark-diary-entries-in-calendar t)
 '(mark-even-if-inactive t)
 '(package-selected-packages
   (quote
    (yasnippet tabbar session racer multi-compile magit go-eldoc git flycheck-rust company-go cmake-mode)))
 '(py-python-command "ipython")
 '(python-python-command "python")
 '(quack-default-program "mzscheme")
 '(quack-manuals (quote (("PLT" plt nil))))
 '(scheme-program-name "mzscheme")
 '(scheme-programm-name "mzscheme" t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t nil (paren))
 '(size-indication-mode t)
 '(tags-add-tables t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(transient-mark-mode t)
 '(which-function-mode nil nil (which-func)))

(add-to-list 'load-path "~/.elisp/packages")
					;(add-to-list 'load-path "~/.emacs.d/elpa" "~/.elisp/packages")

(require 'cl)
(require 'package)

(setq cfg-var:packages '(session
			 git magit
			 ido tabbar
			 company flycheck yasnippet multi-compile
			 go-mode go-eldoc company-go cmake-mode
			 rust-mode racer flycheck-rust))

(defun cfg:install-packages ()
  (let ((pkgs (remove-if #'package-installed-p cfg-var:packages)))
    (when pkgs
      (message "%s" "Emacs is now refreshing its package database...")
      (package-refresh-contents)
      (message "%s" " done.")
      (dolist (p cfg-var:packages)
        (package-install p)))))

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(cfg:install-packages)

(require 'compile)
(require 'cmake-mode)
(require 'tabbar)
(require 'ido)
(require 'session)
(require 'desktop)
(require 'tar-mode)

(setq auto-mode-alist
      (append '(("\\.cpp$" . c++-mode)
		("\\.tcc$" . c++-mode)
		("\\.hpp$" . c++-mode)
		("\\.h$"   . c++-mode)
		("\\.h$"   . c-mode)
		("\\.c$"   . c-mode)
		("\\.cc$"  .  c++-mode)
		("\\.lsp$" . lisp-mode)
		("\\.el$"  . emacs-lisp-mode)
		("\\.scm$" . scheme-mode)
		("\\.pl$"  . cperl-mode)
		("\\.rb$" . ruby-mode)
		("\\.[hg]s$"  . haskell-mode)
		("\\.hi$"     . haskell-mode)
		("\\.l[hg]s$" . literate-haskell-mode)
		("\\.ml[iylp]?$" . tuareg-mode)
		("\\.py" . python-mode)
		("SConstruct" . python-mode)
		("SConscript" . python-mode)
		("\\.asd" . lisp-mode)
		("\\.d$" . d-mode)
		("\\.di$" . d-mode)
		("CMakeLists.txt" . cmake-mode)
		("\\.lua$" . lua-mode)
		("\\.xslt$" . xml-mode)
		) 
	      auto-mode-alist))

(eshell)

(load-file "~/.elisp/rc-functions.el")
(load-file "~/.elisp/rc-git.el")
(load-file "~/.elisp/rc-keybindings.el")
(load-file "~/.elisp/rc-golang.el")
(load-file "~/.elisp/rc-rust.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file "~/.elisp/rc-ui.el")
