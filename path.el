;; zsh path
(setenv "PATH" (concat (getenv "PATH") ";/Users/sang/.opam/refinement/bin;/Users/sang/.ghcup/bin;/Users/sang/.opam/iris-tutorial/bin;/Users/sang/.cabal/bin;/Users/sang/.ghcup/bin;/opt/homebrew/bin;/opt/homebrew/sbin;/usr/local/bin;/System/Cryptexes/App/usr/bin;/usr/bin;/bin;/usr/sbin;/sbin;/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin;/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin;/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin;/Library/TeX/texbin;/opt/homebrew/bin;/opt/homebrew/sbin;/Applications/Emacs.app/Contents/MacOS/bin-arm64-11;/Applications/Emacs.app/Contents/MacOS/libexec-arm64-11"))

;; haskell path
(setenv "PATH" (concat (getenv "HOME") "/.ghcup/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '((concat (getenv "HOME") "/.ghcup/bin"))))
