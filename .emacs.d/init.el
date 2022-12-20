;;; init.el --- emacs configuration file -*- lexical-binding: t; -*-

;;; Commentary:

;; Personal Emacs config file.

;;; Code:

;; Default fonts
(set-face-attribute 'default nil :height 130 :family "SauceCodePro Nerd Font")
(set-face-attribute 'fixed-pitch nil :family "SauceCodePro Nerd Font")
(set-face-attribute 'variable-pitch nil :family "SauceCodePro Nerd Font")

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-selected-packages
      '(which-key rg vterm magit magit-todos yasnippet markdown-mode
        clang-format cmake-mode rust-mode cargo toml-mode yaml-mode
        git-modes pdf-tools))

(setq package-native-compile t
      native-comp-async-report-warnings-errors nil
      package-quickstart t
      vterm-always-compile-module t)

(unless (seq-every-p #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (package-install-selected-packages t))

;; Disable default welcome screen
(setq inhibit-startup-screen t
      initial-scratch-message nil
      server-client-instructions nil)

;; Disable menubar, scrollbar and toolbar
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Default to UTF-8
(set-default-coding-systems 'utf-8)

;; Reduce confirmations
(setq use-short-answers t
      confirm-kill-processes nil
      kill-buffer-query-functions nil
      auth-source-save-behavior nil
      enable-local-variables :safe
      disabled-command-function nil)

;; Disable litter files
(setq auto-save-file-name-transforms
      `((".*" ,(file-name-concat user-emacs-directory "auto-save/") t))
      make-backup-files nil
      create-lockfiles nil
      custom-file null-device)

;; Disable overwriting of system clipboard with selection
(setq select-enable-clipboard nil)

;; Update files modified on disk
(setq global-auto-revert-non-file-buffers t)

;; Formatting
(setq-default fill-column 80
              indent-tabs-mode nil
              tab-always-indent nil
              require-final-newline t)

(global-auto-revert-mode)
(global-display-line-numbers-mode)

;;; init.el ends here
