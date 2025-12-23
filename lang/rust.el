(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package rustic
  :ensure t
  :mode ("\\.rs\\'" . rustic-mode)
  :init
	;; auto-formatting when save
  (setq rustic-format-on-save t)
  :config
	;; using eglot for lsp
  (setq rustic-lsp-client 'eglot)

	;; when opening the file, activate eglot
  (add-hook 'rustic-mode-hook #'eglot-ensure)

	;; more convenient set ups
  (setq rustic-indent-method-chain t
        rustic-always-locate-project-on-open t
        rustic-babel-format-src-block nil)

	;; key bindings
	(with-eval-after-load 'rustic
		(define-key rustic-mode-map (kbd "C-c C-b") #'rustic-cargo-build)
		(define-key rustic-mode-map (kbd "C-c C-r") #'rustic-cargo-run)
		(define-key rustic-mode-map (kbd "C-c C-t") #'rustic-cargo-test)
		(define-key rustic-mode-map (kbd "C-c C-f") #'rustic-format-buffer)))
