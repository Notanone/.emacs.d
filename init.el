;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Set path to .emacs.d
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Set path to dependencies
(setq site-lisp-dir (expand-file-name "site-lisp" dotfiles-dir))

;; Set up load path
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path site-lisp-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" dotfiles-dir))
(load custom-file)


;; Lets start with a smattering of sanity
(require 'defaults)

;; Packages setup
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   (cons 'clojure-mode melpa)
   (cons 'dash melpa)
   (cons 'expand-region melpa)
   (cons 'ido-ubiquitous melpa)
   (cons 'monokai-theme marmalade)
   (cons 'multiple-cursors melpa)
   (cons 'nrepl melpa) 
   (cons 'smartparens melpa)
   (cons 'smex melpa)
   (cons 'yasnippet melpa)
   (cons 'solarized-theme melpa)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Misc
(require 'appearance)
(require 'misc)

;; Extensions setup
(require 'setup-ido)
(require 'setup-hippie)
(require 'setup-yasnippet)
(require 'setup-js2-mode)
(require 'setup-smartparens)
(require 'setup-nrepl)

(require 'multiple-cursors)

;; Emacs server
(require 'server)
(unless (server-running-p)
 (server-start))

;; Key mappings
(require 'key-bindings)

;; mode-mappings
(require 'mode-mappings)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" dotfiles-dir))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Load system specific configurations
(setq sys-spec-config (expand-file-name (concat "system-spec/" system-name ".el") dotfiles-dir))
(when (file-exists-p sys-spec-config) (load sys-spec-config))

;; Set up directory for backups and temp files <MUST BE SET IN SYSTEM SPEC CONFIGURATIONS>
;;(setq cache-dir (expand-file-name "cache" dotfiles-dir))

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name "saveplace/.places" cache-dir))

;; Write backup files & autosaves to own directory 
(setq make-backup-files t 
  backup-by-copying t     
  auto-save-file-name-transforms `((".*", (concat cache-dir "/autosaves/\\1") t))
  backup-directory-alist `(("." . ,(expand-file-name "backups" cache-dir)))
  version-control t
  kept-new-versions 2
  kept-old-versions 5
  delete-old-versions t)

(setq recentf-save-file (expand-file-name "recentf.save" cache-dir)) 

;;Automatically save and restore sessions
(setq desktop-dirname            (expand-file-name "desktop" cache-dir)
    desktop-base-file-name      "emacs-desktop"
    desktop-base-lock-name      "lock"
    desktop-path                (list desktop-dirname)
    desktop-save                t
    desktop-files-not-to-save   "^$" ;reload tramp paths
    desktop-load-locked-desktop t)
(desktop-save-mode 1)


(require 'setup-smex)
