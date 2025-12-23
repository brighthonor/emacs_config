;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Whenever you encounter unknown error on installing useful packages,  ;;
;; please try "M-x package-refresh-contents".                           ;;
;; It may solve the problems                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; package manager
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-milkboxx" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; USE-PACKAGE
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; COMPANY-COQ
(use-package proof-general :ensure t)
(use-package company-coq :ensure t
  :config
  (add-hook 'coq-mode-hook #'company-coq-mode))
(setq coq-prog-name "opam exec -- coqtop")


(global-set-key [?\s-l] 'maths-menu-insert-lambda)
(global-set-key [?\s-l] 'maths-menu-insert-lambda)

(global-set-key [?\s-l] 'maths-menu-insert-lambda)
(global-set-key [?\s-L] 'maths-menu-insert-Lambda)
(global-set-key [?\s-D] 'maths-menu-insert-Delta)

(global-set-key [?\s-a] 'maths-menu-insert-for-all)
(global-set-key [?\s-e] 'maths-menu-insert-there-exists)
(global-set-key [?\s-t] 'maths-menu-insert-down-tack)
(global-set-key [?\s-b] 'maths-menu-insert-up-tack)

(global-set-key [?\s-\#] 'maths-menu-insert-music-sharp-sign)
(global-set-key [?\s-\.] 'maths-menu-insert-horizontal-ellipsis)

(global-set-key [?\s-3] 'proof-three-window-toggle)

;; Tuareg for OCaml
(use-package tuareg
	:ensure t
	:mode (("\\.ml\\'" . tuareg-mode)
         ("\\.mli\\'" . tuareg-mode)
				 ("\\.mll\\'" . tuareg-mode)
				 ("\\.mly\\'" . tuareg-mode)
         ("\\.ocamlinit\\'" . tuareg-mode))
  :hook ((tuareg-mode . electric-indent-mode))
  :config
  (setq compilation-read-command nil)
  (setq compile-command "dune build")
	(setq ocaml-config-file "~/.emacs.d/lang/ocaml.el")
	(load ocaml-config-file))

;; Config for Rust
(setq rust-config-file "~/.emacs.d/lang/rust.el")
(load rust-config-file)


;; AucTeX
(use-package auctex :ensure t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(use-package tex :ensure auctex)
;; for macOS
(add-to-list 'exec-path "/Library/TeX/texbin")
;; for debian
(add-to-list 'exec-path "/usr/bin/tex")

;; anzu (search helper)
(use-package anzu :ensure t
	:config (global-anzu-mode +1))

;; Haskell setting
(use-package eglot
	:ensure t
	:config
	(add-to-list 'eglot-server-programs 
							 '(haskell-mode . ("haskell-language-server-wrapper" "--lsp"))))

;; Install and configure company-mode
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package haskell-mode
  :ensure t
	:config
	(custom-set-variables
   '(haskell-process-suggest-remove-import-lines t)
   '(haskell-process-auto-import-loaded-modules t)
   '(haskell-process-log t)
   '(haskell-process-type 'cabal-repl)
	 '(haskell-stylish-on-save t))
	(add-hook 'haskell-mode-hook #'hindent-mode)
	(add-hook 'haskell-mode-hook #'eglot)
  :bind (:map haskell-mode-map
              (("C-c C-c" . haskell-compile)
							 ("C-c C-z" . haskell-interactive-bring)
               ("C-c C-l" . haskell-process-load-file)
               ("C-c C-r" . haskell-process-reload)
               ("C-c C-t" . haskell-process-do-type)
               ("C-c C-i" . haskell-process-do-info))))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))


;; markdown mode
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

;; projectile
(use-package projectile
	:ensure t
	:diminish projectile-mode
	:init
	;; turn oon projectile globally:
	(projectile-mode +1)
	;; choose a prefix on "C-c p" or via the global-map:
	(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
	:config
	;; search your favorite project folder
	(setq projectile-completion-system 'auto)
	;; optionally cache projects for speed
	(setq projectile-enable-caching t)
	;; file-watching method (auto, native, etc.)
	(setq projectile-indexing-method 'alien))

;; magit
(use-package magit
  :ensure t
  :commands (magit-status magit-get-current-branch)
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
	(global-set-key (kbd "C-x g") 'magit-status))

;; envrc with direnv (you need to install direnv in your OS)
(use-package envrc
  :ensure t
  :config
  (envrc-global-mode)
	(add-hook 'projectile-after-switch-project-hook #'envrc-reload))
