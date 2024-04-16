;; package manager
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; USE-PACKAGE
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; TIMU-MACOS THEME
(use-package timu-macos-theme
  :ensure t
  :config
  (load-theme 'timu-macos t))

;; COMPANY-COQ
(use-package proof-general :ensure t)
(use-package company-coq :ensure t
  :config
  (add-hook 'coq-mode-hook #'company-coq-mode))
(setq coq-prog-name "/Users/sang/.opam/default/bin/coqtop")
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

;; ORG-MODE
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
