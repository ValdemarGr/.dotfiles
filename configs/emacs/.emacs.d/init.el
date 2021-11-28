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

(setq packages '(magit helm helm-themes projectile helm-projectile treemacs
		       ace-window helm-ag avy 
		       ivy swiper expand-region
		       company flycheck
		       lsp-mode lsp-ui rescript-mode lsp-rescript
		       cherry-blossom-theme color-theme-sanityinc-tomorrow
		       ))

(dolist (package packages)
  (straight-use-package package))


; helm begin
(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)
; helm-mode 1)				
; helm end

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

; projectile begin
(projectile-mode +1)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq projectile-project-search-path '(("~/git" . 1)))

(add-to-list 'default-frame-alist
	     '(font . "FiraCode Nerd Font Mono-12"))
; projectile end

; avy begin
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
; avy end



(load-theme 'sanityinc-tomorrow-bright t)

(customize-set-variable
  'lsp-rescript-server-command
    '("node" "/home/valde/rescript/extension/server/out/server.js" "--stdio"))
(with-eval-after-load 'rescript-mode
  ;; Tell `lsp-mode` about the `rescript-vscode` LSP server
  (require 'lsp-rescript)
  ;; Enable `lsp-mode` in rescript-mode buffers
  (add-hook 'rescript-mode-hook 'lsp-deferred)
  ;; Enable display of type information in rescript-mode buffers
  (require 'lsp-ui)
  (add-hook 'rescript-mode-hook 'lsp-ui-doc-mode))
