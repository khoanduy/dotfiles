;;; init.el --- emacs configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps all configurations

;;; Code:

(add-to-list 'load-path (expand-file-name "lispc" user-emacs-directory))
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Disable menubar, toolbar, scrollbar
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Disable startup screen and show line numbers
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode)

;; Highlight current line and disable word wrap
(global-hl-line-mode t)
(setq-default truncate-lines 1)

;; Highlight and auto close parens
(show-paren-mode 1)
(electric-pair-mode 1)

;; No backup no autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Font and theme
(set-face-attribute 'default nil :height 110)

;; Load config files
(require 'elpa-cfg)
(require 'util-cfg)

;; Load language specific config
(require 'python-cfg)
(require 'rust-cfg)

;;; init.el ends here
