(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)



;; Highlight current line
(global-hl-line-mode 1)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; No menu bars
(menu-bar-mode -1)

;; Ditch them scrollbars
(scroll-bar-mode -1)

;;(load-theme 'solarized-dark t)
(load-theme 'monokai t)

(provide 'appearance)
