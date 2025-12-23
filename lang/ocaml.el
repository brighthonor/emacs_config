(add-to-list 'exec-path "/Users/sang/.opam/default/bin")

;; Merlin: type-at-point, go-to-def, completion, errors
(use-package merlin
	:ensure t
  :hook (tuareg-mode . merlin-mode)
  :config
  (setq merlin-command 'opam))  ;; find merlin from OPAM

;; Optional: Eldoc popups with types
(use-package merlin-eldoc
	:ensure t
  :after merlin
  :hook (merlin-mode . merlin-eldoc-setup))

;; REPL (utop is nicer than stock REPL)
(use-package utop
	:ensure t
  :hook (tuareg-mode . utop-minor-mode)
  :config
  (setq utop-command "opam exec -- utop -emacs")
  (with-eval-after-load 'tuareg
    (define-key tuareg-mode-map (kbd "C-c C-r") nil)
    (define-key tuareg-mode-map (kbd "C-c C-s") nil))
  (define-key utop-minor-mode-map (kbd "C-c C-s") #'utop)
  (define-key utop-minor-mode-map (kbd "C-c C-r") #'utop-eval-region)
  (define-key utop-minor-mode-map (kbd "C-c C-b") #'utop-eval-buffer)
  (define-key utop-minor-mode-map (kbd "C-c C-p") #'utop-eval-phrase))

;; Formatter (ocamlformat)
(use-package reformatter
	:ensure t
  :defer t)

(use-package company
	:ensure t
  :hook (tuareg-mode . company-mode))

