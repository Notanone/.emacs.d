(require 'cider)

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq cider-show-error-buffer nil)

(provide 'setup-cider)
