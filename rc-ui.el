(tool-bar-mode 0)
(menu-bar-mode 1)
(scroll-bar-mode 1)

(setq inhibit-startup-message t)

(add-to-list 'desktop-locals-to-save 'buffer-file-coding-system)

(ido-mode t)
(tabbar-mode t)
(add-hook 'after-init-hook 'session-initialize)

(setq x-select-enable-clipboard t)

;;Mouse

(mouse-wheel-mode 1) ;; mouse scroll

;;compilation window shall scroll down
(setq compilation-scroll-output 1)
(which-function-mode)

(setq scroll-conservatively 50)
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 10)

;(set-face-font 'default "7x14")
(set-default-font "Terminal 14")
(show-paren-mode t)

(column-number-mode 1)

;; Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)
        (define-key query-replace-map [return] 'act)
        (define-key query-replace-map [?\C-m] 'act)

;; Always end a file with a newline
(setq require-final-newline t)

(setq save-place t)

(setq abbrev-mode 1)

(put 'narrow-to-region 'disabled nil)

;(server-start) ;;for emacsclient
(which-function-mode)
(setq display-time-day-and-date t)
(display-time-mode)
(blink-cursor-mode)

;; this means hitting the compile button always saves the buffer
;; having to separately hit C-x C-s is a waste of time
(setq mode-compile-always-save-buffer-p t)
;; make the compile window stick at 12 lines tall
(setq compilation-window-height 12)
 
(set-cursor-color "red")

(require 'uniquify)
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")
