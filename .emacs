(set-default-font "6x13")
;(set-default-font "10x17")
;(tool-bar-mode -1)
(menu-bar-mode -1)

(setq load-path
      (append (list nil "~/.emacs.d/site"
		    )
	      load-path))

;(load "/Users/kyle/.emacs.d/jstestmacs")
(load "/Users/kyle/.emacs.d/popwin")
(load "/Users/kyle/.emacs.d/markdown-mode")
(load "/Users/kyle/.emacs.d/color-theme-blackboard")
(load "/Users/kyle/.emacs.d/actionscript-mode")
(load "/Users/kyle/.emacs.d/coffee-mode")
(load "/Users/kyle/.emacs.d/elpa-to-submit/color-theme")
;(load "/Users/kyle/.emacs.d/init")
(load "/Users/kyle/.emacs.d/tabbar")
(load "/Users/kyle/.emacs.d/go-mode")
;(load "/Users/kyle/.emacs.d/javascript") ;js2 mode?

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



;(add-to-list 'load-path "/Users/kyle/google/jstestdriver")

(setq jstestmacs-driver-dir "~/google/jstestdriver/JsTestDriver.jar/"
      jstestmacs-test-browser "/Chrome"
      jstestmacs--port "4224")
(require 'jstestmacs)
(add-hook 'js-mode-hook
         '(lambda ()
            (local-set-key "\C-ct" 'jstestmacs-dwim)))


;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
