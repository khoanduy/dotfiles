;;; init.el -- My Emacs configuration
                                        ;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; These are my personal configuration files,
;; which could be changed as I develop my environment
;; across multiple systems.
;;
;;; Code:

(setq initial-scratch-message
      (concat
       ";; Welcome back,\n"
       ";; Khoa Nguyen\n"))

(package-initialize)

(add-to-list 'load-path (expand-file-name "lispc" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;;; Standard package repositories
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Font
(set-face-attribute 'default nil :font "Ubuntu Mono-12")

;; Essential settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(show-paren-mode 1)
(global-hl-line-mode t)

(setq-default indent-tabs-mode nil)
(setq frame-title-format "%f")

(setq tab-width 4)
(setq make-backup-files nil)

(global-display-line-numbers-mode)

;; Packages configuration
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t))

(use-package exec-path-from-shell
  :ensure t
  :defer t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package which-key
  :ensure t
  :defer t
  :config
  (which-key-mode t))

(use-package magit
  :ensure t
  :defer t)

(use-package helm
  :ensure t
  :demand t
  :bind (("M-x" . helm-M-x)
         ("C-c h" . helm-command-prefix)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
         ("C-z" . helm-select-action))
  :config
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-split-window-inside-p t)
  (setq helm-move-to-line-cycle-in-source t)
  (setq helm-ff-file-name-history-use-recentf t)
  (setq helm-ff-search-library-in-sexp t)
  (setq helm-echo-input-in-header-line t)
  (setq helm-scroll-amount 9)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 20)
  (setq helm-autoresize-mode t)
  (helm-mode 1))

(use-package projectile
  :ensure t
  :after helm
  :bind-keymap
  (("C-c p" . projectile-command-map))
  :config
  (projectile-mode +1))

(use-package helm-projectile
  :ensure t
  :defer t
  :commands (helm-projectile helm-projectile-switch-project)
  :config
  (helm-projectile-on))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.5)
  (setq company-selection-wrap-around t)
  (define-key company-active-map (kbd "ESC") 'company-abort)
  (define-key company-active-map [tab] 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (global-company-mode))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((c++-mode . lsp-deferred)
         (java-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t
  :defer t
  :commands lsp-ui-mode)

(use-package helm-lsp
  :ensure t
  :defer t
  :commands helm-lsp-workspace-symbol)

(use-package dap-mode
  :ensure t
  :defer t
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  (dap-ui-controls-mode 1))

(use-package mood-line
  :ensure t
  :config (mood-line-mode))

(use-package minions
  :ensure t
  :config (minions-mode 1))

(provide 'init)
;;; init.el ends here
