; straight.el begin
; https://github.com/raxod502/straight.el init
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil)
; straight.el end

(setq packages '(magit helm))

(dolist (package packages)
  (straight-use-package package))


; helm begin
(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)
; helm-mode 1)				
; helm end
