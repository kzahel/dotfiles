(set-default-font "6x13")
;(set-default-font "10x17")
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq load-path
      (append (list nil "~/.emacs.d/site"
		    )
	      load-path))


(load "/usr/share/emacs/site-lisp/site-gentoo")
(load "/home/kyle/.emacs.d/color-theme-blackboard")
(load "/home/kyle/.emacs.d/actionscript-mode")
(load "/home/kyle/.emacs.d/coffee-mode")
(load "/home/kyle/.emacs.d/elpa-to-submit/color-theme")
;(load "/home/kyle/.emacs.d/init")
(load "/home/kyle/.emacs.d/tabbar")
;(load "/home/kyle/.emacs.d/javascript") ;js2 mode?

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))

(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

(setq tab-width 4)
(setq indent-tabs-mode t) 


(tabbar-mode )
(set-scroll-bar-mode `right)
(setq inhibit-startup-message t)
(global-set-key (kbd "<C-tab>") 'bs-cycle-next)
(global-set-key (kbd "<C-S-tab>") 'bs-cycle-previous)
(setq display-time-24hr-format t)
(display-time)
(color-theme-blackboard )

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




(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 4))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))
