(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; Disable highlighting
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay nil)
(setq sp-highlight-wrap-tag-overlay nil)


(sp-with '( clojure-mode
	    nrepl-mode
           )
  ;; disable ' everywhere, it's the quote character!
  (sp-add-local-ban-insert-pair "'")
  ;; also disable the pseudo-quote inside code.  We keep it in
  ;; commends and strings for hyperlinks
  (sp-add-local-ban-insert-pair-in-code "`"))

(provide 'setup-smartparens)


