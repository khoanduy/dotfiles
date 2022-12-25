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
      auto-save-default nil
      create-lockfiles nil)

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

;; Hide minor mode function
(defun khoarx/hide-mode (mode &optional value)
  "Remove display for mode MODE from the mode line or set to VALUE."
  (setf (alist-get mode minor-mode-alist) (list value)))

;; exec-path-from-shell
(use-package exec-path-from-shell
  :straight t
  :if (eq system-type 'darwin)
  :config
  (exec-path-from-shell-initialize))

;; Fonts and theme
(set-face-attribute 'default nil :height 130 :family "SauceCodePro Nerd Font")
(set-face-attribute 'fixed-pitch nil :family "SauceCodePro Nerd Font")
(set-face-attribute 'variable-pitch nil :family "SauceCodePro Nerd Font")

(use-package doom-themes
  :straight t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic nil)
  (load-theme 'doom-nord t))

;; Modeline
(use-package doom-modeline
  :straight t
  :init
  (doom-modeline-mode))

;; MacOS option as meta and esc as C-g
(setq mac-command-modifier 'super
      mac-option-modifier 'meta)

;; Start maximize
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(global-visual-line-mode 1)
(global-set-key (kbd "C-H") 'help-command)

;; Git gutter
(use-package git-gutter
  :straight t
  :config
  (global-git-gutter-mode)
  (khoarx/hide-mode 'git-gutter-mode))

(use-package git-gutter-fringe
  :straight t
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

;; Elcord
(use-package elcord
  :straight t
  :custom
  (elcord-editor-icon 'emacs_material_icon)
  :config
  (elcord-mode)
  (khoarx/hide-mode 'elcord-mode))

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
  (which-key-mode)
  (khoarx/hide-mode 'which-key-mode))

;; Evil everywhere
(defun khoarx/conf-evil ()
  "Configure evil mode"

  ;; Utils mappings
  (evil-define-key 'normal global-map (kbd ",:") 'eval-expression)
  (evil-define-key 'normal global-map (kbd ",cc") 'evil-commentary-line)
  (evil-define-key 'visual global-map (kbd ",cc") 'evil-commentary)

  ;; Project mappings
  (evil-define-key 'normal global-map (kbd ",pp") 'projectile-switch-project)
  (evil-define-key 'normal global-map (kbd ",pf") 'projectile-find-file)
  (evil-define-key 'normal global-map (kbd ",pb") 'projectile-switch-to-buffer)
  (evil-define-key 'normal global-map (kbd ",pd") 'projectile-find-dir)
  (evil-define-key 'normal global-map (kbd ",pD") 'projectile-dired)
  (evil-define-key 'normal global-map (kbd ",ps") 'projectile-ripgrep)

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
  (evil-collection-init)
  (khoarx/hide-mode 'evil-collection-unimpaired-mode))

(use-package evil-surround
  :after evil
  :straight t
  :config
  (global-evil-surround-mode))

(use-package evil-commentary
  :after evil
  :straight t
  :config
  (evil-commentary-mode)
  (khoarx/hide-mode 'evil-commentary-mode))

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

;; Ivy
(use-package ivy
  :straight t
  :diminish
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config
  (ivy-mode)
  (khoarx/hide-mode 'ivy-mode))

(use-package counsel
  :after ivy
  :straight t
  :config
  (counsel-mode)
  (khoarx/hide-mode 'counsel-mode))

(use-package swiper
  :after ivy
  :straight t)

;; Projectile
(use-package projectile
  :straight t
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode))

;; Ripgrep
(use-package rg
  :straight t)

;; Magit
(use-package magit
  :straight t
  :defer t
  :hook
  (git-commit-mode . evil-insert-state))

;; Tree sitter
(use-package tree-sitter
  :straight t
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :straight t)

;; Eglot
(use-package eglot
  :straight t)

;; Flymake
(use-package flymake
    :custom
    (flymake-mode-line-format nil)
    (flymake-suppress-zero-counters t))

(defun khoarx/enable-flymake-in-buffer ()
  (unless buffer-read-only
    (flymake-mode)))

(defun khoarx/enable-flymake ()
  "Enable `flymake-mode' if buffer is modifiable."
  (add-hook 'enable-flymake-hook
            #'khoarx/enable-flymake-in-buffer
            nil t))

;; Corfu
(use-package corfu
  :straight t
  :config
  (setq corfu-cycle t
        corfu-auto t)
  (global-corfu-mode))

;; Python
(use-package python
  :custom
  (python-shell-interpreter "python3")
  :hook
  (python-mode . khoarx/enable-flymake)
  (python-mode . eglot-ensure)
  (python-mode . tree-sitter-hl-mode))

;; Garbage collect when idle
(use-package gcmh
  :straight t
  :config
  (setq gcmh-idle-delay 'auto
        gcmh-auto-idle-delay-factor 10
        gcmh-high-cons-threshold (* 32 1024 1024))

  (gcmh-mode)
  (khoarx/hide-mode 'gcmh-mode))

(provide 'init)
;;; init.el ends here
