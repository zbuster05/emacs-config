;; Consider using General for keybindings TODO

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
   '("a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "9f9fc38446c384a4e909b7220d15bf0c152849ef42f5b1b97356448612c77953" "b7e460a67bcb6cac0a6aadfdc99bdf8bbfca1393da535d4e8945df0648fa95fb" "818f548654c0877317aa042d0fbcab4dd218fd9a2be564fa9424db6fd6a13716" "6c386d159853b0ee6695b45e64f598ed45bd67c47f671f69100817d7db64724d" default))
 '(package-selected-packages
   '(hide-mode-line vterm magit yasnippet ccls treemacs-all-the-icons treemacs company lsp-mode flycheck counsel counsel-mode marginalia ivy-prescient prescient all-the-icons-ivy-rich ivy-rich swiper ivy solaire-mode centaur-tabs doom-modeline doom-themes evil-collection evil use-package)))
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
