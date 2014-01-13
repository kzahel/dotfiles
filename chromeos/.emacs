
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))



(add-to-list 'load-path "~/.emacs.d/site/emacs-color-theme-solarized")



(require 'color-theme-solarized)


;; hopefully don't use a mix of tabs and whitespace
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq indent-tabs-mode t) 
