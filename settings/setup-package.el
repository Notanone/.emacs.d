(require 'package)
(require 'cl)

;; Add melpa to package repos
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

; method to check if all packages are installed
(defun packages-installed-p (required-packages)
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(defun packages-install (packages)
  (unless (packages-installed-p packages)
    ; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ; install the missing packages
    (dolist (p packages)
      (when (not (package-installed-p p))
	(package-install p)))))


(provide 'setup-package)
