;(if (< emacs-major-version 24) 
;    (load "~/.emacs.d/package-23"))

(require 'package)

(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(set-default-font "6x13")
;(set-default-font "10x17")

(if (display-graphic-p)
    ; only valid within X
    (progn
      (tool-bar-mode -1)
      (add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/color-theme-solarized-20130515")
      (load-theme 'solarized-dark t)
      (set-scroll-bar-mode `right)
      )
  (progn
    ; no x
    ;(setq solarized-termcolors 16)
    ;(add-to-list 'color-theme-load-path "~/.emacs.d/color-theme-solarized")
    ;(load-theme 'solarized-dark t)
    ;(add-to-list 'custom-theme-load-path "~/.emacs.d/solarized-emacs")
    ;(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/color-theme-solarized-20130515")
    (load-theme 'monokai t)
      (set-scroll-bar-mode `right)
    )
  )

;(set-fringe-style ‘(1 . 1)) 
;(fringe-mode)
(menu-bar-mode -1)
;(setq visible-bell 't)
(setq ring-bell-function nil)

(setq load-path
      (append (list nil "~/.emacs.d/site"
		    )
	      load-path))

;(push "~/.emacs.d/magit" load-path)
;(require 'magit)
;(load "~/.emacs.d/jstestmacs")
;(load "~/.emacs.d/popwin")
;(load "~/.emacs.d/markdown-mode")

;(unless (symbolp 'aquamacs-version)
  (load "~/.emacs.d/tabbar/tabbar")  
  (tabbar-mode)
;)

;(load "~/.emacs.d/actionscript-mode")
;(load "~/.emacs.d/coffee-mode")
;(load "~/.emacs.d/elpa-to-submit/color-theme")
;(load "~/.emacs.d/init")
;(load "~/.emacs.d/tabbar")
;(load "~/.emacs.d/go-mode") ;; loads outdated mode
;(load "~/.emacs.d/javascript") ;js2 mode?

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))

(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

(setq tab-width 4)
(setq indent-tabs-mode t) 

(setq inhibit-startup-message t)
(global-set-key (kbd "<C-tab>") 'bs-cycle-previous)
(global-set-key (kbd "<C-S-tab>") 'bs-cycle-next)
(setq display-time-24hr-format t)
(display-time)

(defun set-mark-and-goto-line (line)
   "Set mark and prompt for a line to go to."
   (interactive "NLine #: ")
   (push-mark nil t nil)
   (goto-line line)
   (message "Mark set where you came from."))

(global-set-key "\C-\\" 'set-mark-and-goto-line)
(global-set-key "\M-o" 'bs-cycle-next)
(global-set-key "\C-o" 'other-window)
(global-set-key "\M-/" 'dabbrev-expand)
(global-set-key "\M-\\" 'revert-buffer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




(defun emacs-buffer-p (name)
  (string-match-p "\\*.*\\*" name))

(defun next-non-emacs-buffer (&optional original)
  "Similar to next-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (next-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (next-non-emacs-buffer tmp-orig))))

(defun previous-non-emacs-buffer (&optional original)
  "Similar to previous-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (previous-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (previous-non-emacs-buffer tmp-orig))))

;(global-set-key (kbd "C-b") 'next-non-emacs-buffer)
;(global-set-key (kbd "M-b") 'previous-non-emacs-buffer)



(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1))))



;; go mode
(setq load-path (cons "/usr/local/go/misc/emacs" load-path))
;;(setq load-path (cons "~/.emacs.d/go" load-path))
(require 'go-mode-load)

(defun my-go-mode-hook () 
  (add-hook 'before-save-hook 'gofmt-before-save) 
  (setq tab-width 4 indent-tabs-mode 1)) 
(add-hook 'go-mode-hook 'my-go-mode-hook)


(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))
