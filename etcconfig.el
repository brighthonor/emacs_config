;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This file is only for graduated school   ;;
;; i.e.) coq, unicode, and directory config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; for unicode
(global-set-key (kbd "C-s-u o") (lambda () (interactive) (insert "ö")))
(global-set-key (kbd "C-s-u p") (lambda () (interactive) (insert "Φ")))
(global-set-key (kbd "C-s-u q") (lambda () (interactive) (insert "●")))
(global-set-key (kbd "C-s-u w") (lambda () (interactive) (insert "◯")))
(global-set-key (kbd "C-s-u y") (lambda () (interactive) (insert "γ")))
(global-set-key (kbd "C-s-u l") (lambda () (interactive) (insert "ₗ")))


(defun split-window-and-run-shell (shell-type)
  (let ((width (window-width))
        (height (window-height)))
    (if (> (+ 100 height) width)
        (split-window-vertically)
      (split-window-horizontally))
    (other-window 1)
    (cond
     ((equal shell-type 'eshell) (eshell))
     ((equal shell-type 'ansi-term) (ansi-term "/bin/zsh")))))

(global-set-key (kbd "C-s-e") (lambda () (interactive) (split-window-and-run-shell 'eshell)))

(global-set-key (kbd "C-s-w") (lambda () (interactive) (split-window-and-run-shell 'ansi-term)))


