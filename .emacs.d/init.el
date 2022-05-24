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

;; Init buffer and cursor shape
(setq-default cursor-type 'bar)
(setq frame-title-format "emacs")
(setq initial-major-mode 'markdown-mode)
(setq initial-scratch-message "Hi there :D")

;; Highlight current line and disable word wrap
(global-hl-line-mode t)
(global-visual-line-mode t)
(setq-default truncate-lines 1)

;; Highlight and auto close parens
(show-paren-mode 1)
(electric-pair-mode 1)

;; No backup no autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Font and theme
(set-face-attribute 'default nil :height 110 :weight 'normal :width 'normal)

;; Load config files
(require 'elpa-cfg)
(require 'util-cfg)

;; Load language specific config
(require 'python-cfg)
(require 'rust-cfg)
(require 'javascript-cfg)

;; Move between windows
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Resize windows
(global-set-key (kbd "C-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-s-<down>") 'shrink-window)
(global-set-key (kbd "C-s-<up>") 'enlarge-window)

;;; init.el ends here
