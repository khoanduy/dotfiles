;;; init.el -- Emacs configuration
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; Hello world :D
;;
;;; Code:

;; Encoding
(setq-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

(setq initial-scratch-message
      (concat
       ";; This buffer is for Lisp evaluation and will not be saved.\n"
       ";; Happy coding :D\n"
       ";;\n"
       ";;   .-''''-.                   \n"
       ";;  /      o\\                  \n"
       ";; |    o   0).-.               \n"
       ";; |       .-;(_/     .-.       \n"
       ";; \\     /  /)).---._|  `\\   ,\n"
       ";;  '.  '  /((       `'-./ _/|  \n"
       ";;   \\  .'  )        .-.;`   / \n"
       ";;    '.             |  `\\--'  \n"
       ";;      '._        -'    /      \n"
       ";;~~~      ``''--`------`       \n"))

(package-initialize)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(if (not (eq window-system 'w32))
    (add-to-list 'exec-path "/usr/local/bin"))

;; Separate custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Init ELPA
(require 'elpa-init)

;; Some basic UI settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(set-frame-font "FiraCode 11" nil t)
(setq backup-inhibited t)
(setq auto-save-default nil)

(show-paren-mode 1)
(setq show-paren-delay 0)

(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default left-fringe-width nil)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)

(setq visible-bell t)
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(column-number-mode t)
(setq tab-width 4)

;; Essential packages
(require 'utils-init)
(require 'evil-init)

;;; init.el ends here
