;; Groovy
(autoload 'groovy-mode "groovy-mode")
(add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))

;; JavsScript 
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(provide 'mode-mappings)
