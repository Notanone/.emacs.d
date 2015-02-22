;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen
(setq inhibit-startup-message t)

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

(setq temp-dir
      (expand-file-name "temp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)

;; Keep emacs custom-settings in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)



;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat temp-dir "/backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" temp-dir))

;; Recent visited filed list
(setq recentf-save-file (expand-file-name "recentf.save" temp-dir)) 

;; Setup packages
(require 'setup-package)

(packages-install
 '(dash
   smartparens
   smex
   guide-key
   flx-ido
   ido-ubiquitous
   ido-vertical-mode
   ido-at-point
   multiple-cursors
   expand-region
   smart-mode-line
   solarized-theme
   ))

(require 'appearance)

;; Defaults
(require 'sane-defaults)

(require 'setup-smex)
(require 'setup-guide-key)
(require 'setup-ido)
(require 'setup-multiple-cursors)
(require 'setup-smartparens)
(require 'setup-smart-mode-line)

;; Setup key bindings
(require 'key-bindings)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

