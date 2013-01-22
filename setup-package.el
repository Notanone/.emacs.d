(require 'package)

(defvar marmalade '("marmalade" . "http://marmalade-repo.org/packages/"))
(defvar gnu '("gnu" . "http://elpa.gnu.org/packages/"))
(defvar melpa '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Add marmalade to package repos
(add-to-list 'package-archives marmalade)
(add-to-list 'package-archives melpa t)

(package-initialize)

(setq site-lisp-dir (expand-file-name "site-lisp" dotfiles-dir))

(unless (and (file-exists-p (expand-file-name "elpa/archives/marmalade" dotfiles-dir))
             (file-exists-p (expand-file-name "elpa/archives/gnu" dotfiles-dir))
             (file-exists-p (expand-file-name "elpa/archives/melpa" dotfiles-dir)))
  (package-refresh-contents))

(defun packages-install (&rest packages)
  (mapc (lambda (package)
          (let ((name (car package))
                (repo (cdr package)))
            (when (not (package-installed-p name))
              (let ((package-archives (list repo)))
                (package-initialize)
                (package-install name)))))
        packages)
  (package-initialize)
  (delete-other-windows))

(provide 'setup-package)
