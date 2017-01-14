(require 'company)
(require 'flycheck)
(require 'yasnippet)
(require 'multi-compile)
(require 'go-eldoc)
(require 'company-go)

(add-hook 'before-save-hook 'gofmt-before-save)
(setq-default gofmt-command "goimports")
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook (lambda ()
			  (set (make-local-variable 'company-backends) '(company-go))
			  (company-mode)))

(add-hook 'go-mode-hook 'yas-minor-mode)
(add-hook 'go-mode-hook 'flycheck-mode)

(setq multi-compile-alist '(
			    (go-mode . (
					("go-build" "go build -v"
					 (locate-dominating-file buffer-file-name ".git"))
					("go-build-and-run" "go build -v && echo 'build finish' && eval ./${PWD##*/}"
					 (multi-compile-locate-file-dir ".git"))))))

;;general compile function call "make all"
(defun go-save-and-make-all ()
  "save and call compile as make all"
  (interactive)
  (save-buffer)
  (compile "go build -v")
  (message "make all executed!"))

(defun go-save-and-test-all ()
  "save and call compile as make all"
  (interactive)
  (save-buffer)
  (compile "go test -v")
  (message "go test  executed!"))

(global-set-key (kbd "C-b") 'go-save-and-make-all)
(global-set-key (kbd "C-t") 'go-save-and-test-all)

(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))

(setenv "GOPATH" "/home/lsv/develop/go/")
