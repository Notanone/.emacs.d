(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

(provide 'setup-guide-key)
