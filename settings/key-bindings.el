;; Smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; Completion that uses many different methods to find 
(global-set-key (kbd "M-SPC") 'hippie-expand)
(global-set-key (kbd "C-,") 'completion-at-point)

;; Expand region (increases selected region by semantic units)
(global-set-key (kbd "C-'") 'er/expand-region)

;; Multiple cursors/mark like this
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; File finding
(global-set-key (kbd "C-x f") 'recentf-open-files)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'key-bindings)
