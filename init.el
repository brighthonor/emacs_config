;; remove splash screen
(setq inhibit-splash-screen t)

;; enable syntax highlight
(global-font-lock-mode t)
(transient-mark-mode t)

;; frame
(add-to-list 'default-frame-alist '(height . 48))
(add-to-list 'default-frame-alist '(width . 180))
(set-frame-position (selected-frame) 20 10)

;; encoding
(set-language-environment 'utf-8)

;; line number
(global-display-line-numbers-mode 1)

;; tab width
(setq-default tab-width 2)

;; max-eval-depth
(setq max-lisp-eval-depth 10000)

;; windows move keybinding
;; (windmove-default-keybindings)
;; windows move keybinding
(global-set-key (kbd "C-s-h")  'windmove-left)
(global-set-key (kbd "C-s-l") 'windmove-right)
(global-set-key (kbd "C-s-k")    'windmove-up)
(global-set-key (kbd "C-s-j")  'windmove-down)

;; scroll-bar mode
(scroll-bar-mode 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; package file
(setq package-file "~/.emacs.d/package.el")
(load package-file)

;; path file
(setq path-file "~/.emacs.d/path.el")
(load path-file)

;; theme file
(setq theme-file "~/.emacs.d/theme.el")
(load theme-file)

;; org mode
(setq orgconfig-file "~/.emacs.d/orgconfig.el")
(load orgconfig-file)

;; auctex
(setq auctex-file "~/.emacs.d/auctex.el")
(load auctex-file)

;; etc file (e.g., how to type ö?)
(setq etcconfig-file "~/.emacs.d/etcconfig.el")
(load etcconfig-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; default Latin font (e.g. Consolas)
(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 100)
