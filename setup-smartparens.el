(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; Disable highlighting
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay nil)
(setq sp-highlight-wrap-tag-overlay nil)


(sp-with-modes '(clojure-mode nrepl-mode)
  (sp-local-pair "'" nil :unless nil))

(provide 'setup-smartparens)


