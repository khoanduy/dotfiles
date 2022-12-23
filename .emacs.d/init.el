;;; init.el --- emacs configuration file -*- lexical-binding: t; -*-
;;-*-Emacs-Lisp-*-;;

;;; Commentary:
;;
;; My personal Emacs config file.
;;
;;; Code:

;; Separate custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Add themes to load-path
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

;; straight.el install
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default t)

;; Disable default welcome screen
(setq inhibit-startup-screen t
      initial-scratch-message ";; This buffer is for Lisp evaluation that is not saved.\n"
      server-client-instructions nil
      inhibit-startup-echo-area-message t)

;; Disable menubar, scrollbar, toolbar and parens
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Default to UTF-8
(set-default-coding-systems 'utf-8)
(setq frame-title-format "%b")

;; Reduce confirmations
(setq use-short-answers t
      confirm-kill-processes nil
      kill-buffer-query-functions nil
      auth-source-save-behavior nil
      enable-local-variables :safe
      disabled-command-function nil)

;; Get rid of litter files
(setq make-backup-files nil
      create-lockfiles nil
      custom-file null-device)

(auto-save-mode -1)

;; Update files modified on disk
(setq global-auto-revert-non-file-buffers t)

;; Formatting
(setq-default fill-column 80
              indent-tabs-mode nil
              tab-always-indent nil
              require-final-newline t)

(global-auto-revert-mode)
(global-display-line-numbers-mode)

;; Install use-package
(straight-use-package 'use-package)

;; Fonts and theme
(set-face-attribute 'default nil :height 130 :family "SauceCodePro Nerd Font")
(set-face-attribute 'fixed-pitch nil :family "SauceCodePro Nerd Font")
(set-face-attribute 'variable-pitch nil :family "SauceCodePro Nerd Font")

(use-package nord-theme
  :straight t
  :config
  (load-theme 'nord t))

;; MacOS option as meta and esc as C-g
(setq mac-command-modifier 'super
      mac-option-modifier 'meta)

;; Start maximize
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Elcord
(use-package elcord
  :straight t
  :custom
  (elcord-editor-icon 'emacs_material_icon)
  :config
  (elcord-mode))

;; All the icons
(use-package all-the-icons
  :straight t)

;; Which-key
(use-package which-key
  :straight t
  :custom
  (which-key-idle-delay 0.5)
  (which-key-compute-remaps t)
  (which-key-sort-order 'which-key-local-then-key-order)
  (which-key-sort-uppercase-first nil)
  (which-key-unicode-correction 0)
  (which-key-side-window-max-height 0.5)
  :config
  (which-key-mode))

;; Evil everywhere
(defun khoarx/conf-evil ()
  "Configure evil mode"

  ;; Utils mappings
  (evil-define-key 'normal global-map (kbd ",:") 'eval-expression)
  (evil-define-key 'normal global-map (kbd ",cc") 'comment-line)
  (evil-define-key 'visual global-map (kbd ",cc") 'comment-or-uncomment-region)

  ;; Project mappings
  (evil-define-key 'normal global-map (kbd ",pp") 'project-switch-project)
  (evil-define-key 'normal global-map (kbd ",pf") 'project-find-file)
  (evil-define-key 'normal global-map (kbd ",pb") 'project-switch-to-buffer)
  (evil-define-key 'normal global-map (kbd ",pd") 'project-find-dir)
  (evil-define-key 'normal global-map (kbd ",pD") 'project-dired)

  ;; Dired mappings
  (evil-define-key 'normal global-map (kbd ",dd") 'dired)
  (evil-define-key 'normal global-map (kbd ",dj") 'dired-jump)

  ;; File mappings
  (evil-define-key 'normal global-map (kbd ",ff") 'find-file)

  ;; Buffer mappings
  (evil-define-key 'normal global-map (kbd ",bb") 'switch-to-buffer)
  (evil-define-key 'normal global-map (kbd ",bp") 'previous-buffer)
  (evil-define-key 'normal global-map (kbd ",bn") 'next-buffer)
  (evil-define-key 'normal global-map (kbd ",bk") 'kill-this-buffer)

  ;; Magit mappings
  (evil-define-key 'normal global-map (kbd ",gg") 'magit-status)

  ;; Window
  (evil-define-key 'normal global-map (kbd ",wv") 'evil-window-vsplit)
  (evil-define-key 'normal global-map (kbd ",ws") 'evil-window-split)
  (evil-define-key 'normal global-map (kbd ",wb") 'balance-windows)
  (evil-define-key 'normal global-map (kbd ",wd") 'delete-window)
  (evil-define-key 'normal global-map (kbd ",wo") 'delete-other-windows)

  ;; Terminal
  (evil-define-key 'normal global-map (kbd ",tt") 'vterm-toggle)
  (evil-define-key 'normal global-map (kbd ",tT") 'vterm-toggle-cd)

  ;; Remap key to move between panes
  (evil-define-key 'normal global-map (kbd "C-h") 'evil-window-left)
  (evil-define-key 'normal global-map (kbd "C-j") 'evil-window-down)
  (evil-define-key 'normal global-map (kbd "C-k") 'evil-window-up)
  (evil-define-key 'normal global-map (kbd "C-l") 'evil-window-right))

;; Undo fu
(use-package undo-fu
  :straight t)

(use-package evil
  :straight t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  :config
  (add-hook 'evil-mode-hook 'khoarx/conf-evil)
  (evil-mode))

(use-package evil-collection
  :after evil
  :straight t
  :config
  (evil-collection-init))

(use-package evil-surround
  :after evil
  :straight t
  :config
  (global-evil-surround-mode))

;; vterm
(use-package vterm
  :straight t
  :custom
  (package-native-compile t)
  (native-comp-async-report-warnings-errors nil)
  (package-quickstart t)
  (vterm-always-compile-module t))

(use-package vterm-toggle
  :straight t
  :config
  (setq vterm-toggle-scope 'project)
  (setq vterm-toggle-fullscreen-p nil))

;; Ripgrep
(use-package rg
  :straight t)

;; Vertico
(use-package vertico
  :straight t
  :init
  (vertico-mode)
  (setq vertico-cycle t))

(use-package savehist
  :straight t
  :init
  (savehist-mode))

(use-package orderless
  :straight t
  :init
  (setq completion-styles '(substring orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package emacs
  :init
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  (setq read-extended-command-predicate
        #'command-completion-default-include-p)

  (setq enable-recursive-minibuffers t))

;; Magit
(use-package magit
  :straight t
  :defer t
  :hook
  (git-commit-mode . evil-insert-state))

;; Eglot
(use-package eglot
  :straight t)

;; Flymake
(use-package flymake
    :custom
    (flymake-mode-line-format nil)
    (flymake-suppress-zero-counters t))

(defun enable-flymake-in-buffer ()
  (unless buffer-read-only
    (flymake-mode)))

(defun enable-flymake ()
  "Enable `flymake-mode' if buffer is modifiable."
  (add-hook 'enable-flymake-hook
            #'enable-flymake-in-buffer
            nil t))

;; Corfu
(use-package corfu
  :straight t
  :config
  (setq tab-always-indent 'complete
        corfu-cycle t
        corfu-auto t)
  (global-corfu-mode))

;; Python
(use-package lsp-pyright
  :straight t
  :hook
  (python-mode . (lambda ()
                    (require 'lsp-pyright)
                    (eglot-ensure)))
  :custom
  (python-shell-interpreter "python3"))

;; DOOM Modeline
(use-package doom-modeline
  :straight t
  :init
  (doom-modeline-mode 1))

;; Garbage collect when idle
(use-package gcmh
  :straight t
  :config
  (setq gcmh-idle-delay 'auto
        gcmh-auto-idle-delay-factor 10
        gcmh-high-cons-threshold (* 32 1024 1024))

  (gcmh-mode))

(provide 'init)
;;; init.el ends here
