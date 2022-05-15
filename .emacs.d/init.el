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

;; Disable or enable some utils
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Font and theme
(set-face-attribute 'default nil :height 110)

;; Load config files
(require 'elpa-cfg)
(require 'util-cfg)

;;; init.el ends here
