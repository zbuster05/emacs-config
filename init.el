;; WISHLIST
;; Perspectives
;; Better scrolling
;; Consider using General for keybindings (hjkl=jkl;, capslock+jkl=C-x o;)


(require 'package)
(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "f6665ce2f7f56c5ed5d91ed5e7f6acb66ce44d0ef4acfaa3a42c7cfe9e9a9013" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "2c613514f52fb56d34d00cc074fe6b5f4769b4b7f0cc12d22787808addcef12c" "3325e2c49c8cc81a8cc94b0d57f1975e6562858db5de840b03338529c64f58d1" "3d54650e34fa27561eb81fc3ceed504970cc553cfd37f46e8a80ec32254a3ec3" "1a52e224f2e09af1084db19333eb817c23bceab5e742bf93caacbfea5de6b4f6" "22a514f7051c7eac7f07112a217772f704531b136f00e2ccfaa2e2a456558d39" "21055a064d6d673f666baaed35a69519841134829982cbbb76960575f43424db" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "850bb46cc41d8a28669f78b98db04a46053eca663db71a001b40288a9b36796c" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "9f9fc38446c384a4e909b7220d15bf0c152849ef42f5b1b97356448612c77953" "b7e460a67bcb6cac0a6aadfdc99bdf8bbfca1393da535d4e8945df0648fa95fb" "818f548654c0877317aa042d0fbcab4dd218fd9a2be564fa9424db6fd6a13716" "6c386d159853b0ee6695b45e64f598ed45bd67c47f671f69100817d7db64724d" default))
 '(package-selected-packages
   '(helpful which-key no-littering projectile magit-todos dockerfile-mode ayu-theme zygospore hide-mode-line vterm magit yasnippet ccls treemacs-all-the-icons treemacs company lsp-mode flycheck counsel counsel-mode marginalia ivy-prescient prescient all-the-icons-ivy-rich ivy-rich swiper ivy solaire-mode centaur-tabs doom-modeline doom-themes evil-collection evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'use-package)

(setq use-package-always-ensure t)

;; The OG evil package
(use-package evil
    :init
    (setq evil-want-integration t) ;; this is optional since it's already set to t by default.
    (setq evil-want-keybinding nil) ;; so that evil-collection will work?
    :config
    (evil-mode 1)) ;; turn on evil mode

;; A collection of evil behaviors
(use-package evil-collection
    :after evil
    :config
    (evil-collection-init)) ;; initalize

(use-package doom-themes
  :init
  (load-theme 'doom-one))

;; kills the bloody tool bar
(tool-bar-mode -1)

;; kills the menu-bar
(menu-bar-mode -1)

;; disables scroll bar
(scroll-bar-mode -1)

;; disables warning pop-ups
(setq warning-suppress-log-types '((comp)))

(use-package all-the-icons)

(use-package doom-modeline
  :init
  (doom-modeline-mode))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Creates Centaur tabs at the top
(use-package centaur-tabs
  :init
  (setq centaur-tabs-height 16)
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-icon-scale-factor 0.7)
  (centaur-tabs-mode))

;; Increases contrast in programming mode
(use-package solaire-mode
  :hook
  (prog-mode . solaire-mode))

(use-package ivy
  :init
  (ivy-mode))

(use-package swiper
  :after ivy
  :bind
  (("C-s" . swiper-isearch)))

(use-package counsel
  :bind
  (("M-x"     . counsel-M-x)
   ("C-x C-f" . counsel-find-file)))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode))

(use-package all-the-icons-ivy-rich
  :after ivy-rich
  :init
  (all-the-icons-ivy-rich-mode))

(use-package prescient)

(use-package ivy-prescient
  :after ivy prescient
  :init
  (ivy-prescient-mode))

(use-package marginalia
  :init
  (marginalia-mode))

;;;;;;(use-package vterm)

(use-package hide-mode-line)

;; You might be wondering: why is there this giant bloody commented out section under flycheck? Well, let me tell you a story.
;; See once upon a time there was this guy named Jack. He was interested in GNU emacs, yet somehow and no one was sure quite how, his config was simply cursed.
;; Unwisely part of his config was copied below to configure fly check and yes, it somehow managed to break treemacs icons. So no more, it shall be expelled.
(use-package flycheck
  :init
  (global-flycheck-mode))
  ;; :config
  ;; (setq flycheck-check-syntax-automatically '(mode-enabled save))
  ;; (set-face-attribute 'flycheck-error nil :underline t)
  ;; (set-face-attribute 'flycheck-warning nil :underline t)
  ;; (set-face-attribute 'flycheck-info nil :underline t)
  ;; (define-fringe-bitmap 'my-flycheck-fringe-indicator
  ;;   (vector #b00000000
  ;;           #b00000000
  ;;           #b00000000
  ;;           #b00000000
  ;;           #b00000000
  ;;           #b00000000
  ;;           #b00000000
  ;;           #b00011100
  ;;           #b00111110
  ;;           #b00111110
  ;;           #b00111110
  ;;           #b00011100
  ;;           #b00000000
  ;;           #b00000000
  ;;           #b00000000
  ;;           #b00000000
  ;;           #b00000000))
  ;; (let ((bitmap 'my-flycheck-fringe-indicator))
  ;;   (flycheck-define-error-level 'error
  ;;     :severity 2
  ;;     :overlay-category 'flycheck-error-overlay
  ;;     :fringe-bitmap bitmap
  ;;     :error-list-face 'flycheck-error-list-error
  ;;     :fringe-face 'flycheck-fringe-error)
  ;;   (flycheck-define-error-level 'warning
  ;;     :severity 1
  ;;     :overlay-category 'flycheck-warning-overlay
  ;;     :fringe-bitmap bitmap
  ;;     :error-list-face 'flycheck-error-list-warning
  ;;     :fringe-face 'flycheck-fringe-warning)
  ;;   (flycheck-define-error-level 'info
  ;;     :severity 0
  ;;     :overlay-category 'flycheck-info-overlay
  ;;     :fringe-bitmap bitmap
  ;;     :error-list-face 'flycheck-error-list-info
  ;;     :fringe-face 'flycheck-fringe-info)))

(use-package lsp-mode
  :init
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-semantic-tokens-enable t)
  (setq lsp-completion-show-detail nil)
  (setq-default lsp-enable-indentation nil)
  (setq-default lsp-enable-on-type-formatting nil)
  :commands lsp
  :hook ((c-mode . lsp)
         (c++-mode . lsp)
         (python-mode . lsp)
         (typescript-mode . lsp)
         (rust-mode . lsp)))

(use-package treemacs-all-the-icons
  :after treemacs
  :config
  (treemacs-load-theme 'all-the-icons))

(use-package treemacs
  :after doom-themes
  :config
  (setq doom-themes-treemacs-theme "doom-colors")
  :bind
  (("C-c o" . treemacs)))

(add-hook 'treemacs-mode-hook (lambda () (interactive) (setq cursor-type nil)))

(use-package company
  :init
  (setq company-idle-delay 0)
  (setq company-tooltip-maximum-width 40)
  (setq company-icon-size 0)
  (set-face-attribute 'company-tooltip nil
		      :background "#282c34")
  :hook
  (prog-mode . company-mode)
  :bind (:map company-active-map
              ("<ret>" . 'company-complete-selection)))

(use-package company-quickhelp
  :after company
  :init (company-quickhelp-mode))

(use-package company-quickhelp-terminal
  :after company-quickhelp)

(use-package company-prescient
  :after company prescient
  :init
  (setq-default history-length 1000)
  (setq-default prescient-history-length 1000)
  :init (company-prescient-mode))

(use-package ccls
  :hook ((c-mode c++-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp)))
  :custom
  (ccls-executable (executable-find "ccls")) ; Add ccls to path if you haven't done so
  (ccls-sem-highlight-method 'font-lock)
  (ccls-enable-skipped-ranges nil)
  :config
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-tramp-connection (cons ccls-executable ccls-args))
    :major-modes '(c-mode c++-mode cuda-mode)
    :server-id 'ccls-remote
    :multi-root nil
    :remote? t
    :notification-handlers
    (lsp-ht ("$ccls/publishSkippedRanges" #'ccls--publish-skipped-ranges)
            ("$ccls/publishSemanticHighlight" #'ccls--publish-semantic-highlight))
    :initialization-options (lambda () ccls-initialization-options)
    :library-folders-fn nil)))

(use-package yasnippet
  :init
  (yas-global-mode))

(use-package magit)

(use-package zygospore)

;; Fonts
(set-face-attribute 'default nil :font "monospace")

(use-package hl-todo
  :init
  (global-hl-todo-mode)
  (setq hl-todo-keyword-faces
        '(("TODO"   . "#99bb66")
          ("FIXME"  . "#ff6655")
          ("DEBUG"  . "#a9a1e1")
          ("HACK"   . "#6c78dd")
          ("NOTE"   . "#44b9b1")
	  ("WISHLIST" . "#eaedad")))
  ;; We already have todos in Org Mode!
  (add-hook 'org-mode-hook (lambda () (hl-todo-mode -1))))

(use-package magit-todos)

;; NOTE always remember to run M-x projectile-add-known-project to initialize a project
(use-package projectile)

(use-package no-littering
  :init
  (require 'no-littering)
  (setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(use-package which-key
  :init
  (which-key-mode))

(use-package helpful
  :init
  (advice-add 'describe-function :override #'helpful-function)
  (advice-add 'describe-variable :override #'helpful-variable)
  (advice-add 'describe-command :override #'helpful-callable)
  (advice-add 'describe-key :override #'helpful-key)
  (advice-add 'describe-symbol :override #'helpful-symbol)
  :config
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-c C-d") #'helpful-at-point)
  (global-set-key (kbd "C-h F") #'helpful-function)
  (global-set-key (kbd "C-h C") #'helpful-command)
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable))

;;; init.el ends here
