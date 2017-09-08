(require 'ido)
(ido-mode t)
(ido-everywhere t)

;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; flx-ido looks better with ido-vertical-mode
(require 'ido-vertical-mode)
(ido-vertical-mode)

;; Always rescan buffer for imenu
(set-default 'imenu-auto-rescan t)

(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

;; Ido at point (C-,)
(require 'ido-at-point)
(ido-at-point-mode)

(setq ido-save-directory-list-file  (expand-file-name ".ido.last" temp-dir)) 

(provide 'setup-ido)
