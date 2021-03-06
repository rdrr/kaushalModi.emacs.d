;; Time-stamp: <2015-03-17 12:43:54 kmodi>

;; Diff-hl
;; https://github.com/sshaw/git-link

(use-package git-link
    :load-path "elisp/git-link"
    :config
    (progn
      (when (featurep 'region-bindings-mode)
        (bind-keys
         :map region-bindings-mode-map
         ("g" . git-link-force-hash)))))


(provide 'setup-git-link)
