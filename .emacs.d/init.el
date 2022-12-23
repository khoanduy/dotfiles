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

;; Fun stuff
(use-package elcord
  :straight t
  :custom
  (elcord-editor-icon 'emacs_material_icon)
  :config
  (elcord-mode))

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

  ;; Make escape quit everything
  (define-key evil-normal-state-map [escape] 'keyboard-escape-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  ;; Remap key to move between panes
  (evil-define-key 'normal global-map (kbd "C-h") 'evil-window-left)
  (evil-define-key 'normal global-map (kbd "C-j") 'evil-window-down)
  (evil-define-key 'normal global-map (kbd "C-k") 'evil-window-up)
  (evil-define-key 'normal global-map (kbd "C-l") 'evil-window-right))

(defun khoarx/conf-evil-leader ()
  "Configure evil leader mode"
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    ":"  'eval-expression
    "bd"  'kill-this-buffer
    "gg"  'magit-status
    "wv"  'evil-window-vsplit
    "ws"  'evil-window-split
    ))

(use-package evil
  :straight t
  :config
  (add-hook 'evil-mode-hook 'khoarx/conf-evil)
  (evil-mode)

  (use-package evil-leader
    :straight t
    :config
    (global-evil-leader-mode)
    (khoarx/conf-evil-leader))

  (use-package evil-surround
    :straight t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :straight t))

;; vterm
(use-package vterm
  :straight t
  :custom
  (package-native-compile t)
  (native-comp-async-report-warnings-errors nil)
  (package-quickstart t)
  (vterm-always-compile-module t))

;; ripgrep
(use-package rg
  :straight t)

;; magit
(use-package magit
  :straight t
  :defer t
  :hook
  (git-commit-mode . evil-insert-state))

(use-package evil-magit
  :straight t)

;; Config functions
(defun hide-minor-mode (mode &optional value)
  "Remove display for minor mode MODE from the mode line or set to VALUE."
  (setf (alist-get mode minor-mode-alist) (list value)))

;; Mood line
; (mood-line-mode)

;; Flymake
; (setq flymake-mode-line-format nil
      ; flymake-suppress-zero-counters t)

; (defun enable-flymake-in-buffer ()
  ; (unless buffer-read-only
    ; (flymake-mode)))

; (defun enable-flymake ()
  ; "Enable `flymake-mode' if buffer is modifiable."
  ; (add-hook 'enable-flymake-hook
            ; #'enable-flymake-in-buffer
            ; nil t))

;; Eglot
; (setq eglot-stay-out-of '(eldoc-documentation-strategy)
      ; eglot-autoshutdown t)

; (advice-add #'eglot-completion-at-point
            ; :before-until #'inside-program-text-p)

; (with-eval-after-load 'yasnippet
  ; (hide-minor-mode 'yas-minor-mode)
  ; (setq yas-minor-mode-map (make-sparse-keymap)))

; (defun enable-eglot()
  ; "Enable eglot and its dependencies"
  ; (yas-minor-mode)
  ; (require 'eglot)
  ; (add-hook 'enable-eglot-hook #'eglot-ensure nil t))

;; This stops eglot from logging the json events of lsp server
; (setq eglot-events-buffer-size 0)

;; Corfu
; (setq tab-always-indent 'complete
      ; corfu-cycle t
      ; corfu-auto t)

; (global-corfu-mode)

;; Garbage collect when idle
(use-package gcmh
  :straight t
  :config
  (setq gcmh-idle-delay 'auto
        gcmh-auto-idle-delay-factor 10
        gcmh-high-cons-threshold (* 32 1024 1024))

  (gcmh-mode)
  (hide-minor-mode 'gcmh-mode))

(provide 'init)
;;; init.el ends here
