;; Misc-defuns

;; Get current system's name
(defun insert-system-name()
(interactive)
"Get current system's name"
(insert (format "%s" system-name))
)

;; Get current system type
(defun insert-system-type()
(interactive)
"Get current system type"
(insert (format "%s" system-type))
)
