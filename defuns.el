;; Time-stamp: <2014-10-13 09:53:46 kmodi>

;; Collection of general purposes defuns and macros

;; Save typing the lambda mumbo-jumbo
;; Source: https://github.com/waymondo/hemacs/blob/master/defuns.el
(defmacro λ (&rest body)
  (declare (indent 1))
  `(lambda ()
     (interactive)
     ,@body))
(key-chord-define-global "^^" (λ (insert "λ")))


(defun update-custom-theme-load-path ()
  "Ensure that the custom-theme-load-path has all the theme paths added.
Source: http://stackoverflow.com/a/15381087/1219634"
  (interactive)
  (require 'dash)
  (require 's)
  (-each
      (-map
       (lambda (item)
         (format (concat elpa-dir "/%s") item))
       (-filter
        (lambda (item)
          (or (s-contains? "theme" item)
              (s-contains? "smart-mode-line" item)))
        (directory-files elpa-dir)))
    (lambda (item)
      (add-to-list 'custom-theme-load-path item))))


  (provide 'defuns)