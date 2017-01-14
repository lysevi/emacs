;; magit.el
(add-to-list 'vc-handled-backends 'GIT)
(require 'git)
(require 'vc-git)
(require 'magit)

(autoload 'magit-status "magit" nil t)

(global-set-key "\C-cm" 'magit-status)

(custom-set-variables
 '(magit-save-some-buffers (quote dontask)))
