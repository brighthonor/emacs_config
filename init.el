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
(windmove-default-keybindings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; package file
(setq package-file "~/.emacs.d/package.el")
(load package-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; default Latin font (e.g. Consolas)
(set-face-attribute 'default nil :family "Source Code Pro for Powerline" :height 150)
