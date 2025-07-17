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
(setq cris "/home/sang/.opam/cris/bin/coqtop")
(setq cm "/home/sang/.opam/cm/bin/coqtop")
;; (setq coq-prog-name "/Users/sang/.opam/refinement/bin/coqtop")
;; (setq coq-prog-name "/Users/sang/.opam/ccr/bin/coqtop")
;; (setq coq-prog-name "/Users/sang/.opam/default/bin/coqtop")
;; (setq coq-prog-name "/Users/sang/.opam/iris-tutorial/bin/coqtop")
(setq coq-prog-name cris)

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
(use-package tuareg :ensure t)
(add-to-list 'exec-path "/Users/sang/.opam/default/bin")

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
