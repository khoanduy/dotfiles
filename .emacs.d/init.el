;;; init.el --- emacs configuration file -*- lexical-binding: t; -*-

;;; Commentary:

;; Personal Emacs config file.

;;; Code:

;; Default fonts
(set-face-attribute 'default nil :height 130 :family "SauceCodePro Nerd Font")
(set-face-attribute 'fixed-pitch nil :family "SauceCodePro Nerd Font")
(set-face-attribute 'variable-pitch nil :family "SauceCodePro Nerd Font")

;; Add dirs to load path
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

;; Install packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-selected-packages
      '(gcmh ivy evil which-key rg vterm magit magit-todos
        yasnippet markdown-mode clang-format cmake-mode
        rust-mode cargo toml-mode yaml-mode git-modes
        pdf-tools mood-line nord-theme all-the-icons corfu
        swiper counsel))

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

;; Config functions
(defun hide-minor-mode (mode &optional value)
  "Remove display for minor mode MODE from the mode line or set to VALUE."
  (setf (alist-get mode minor-mode-alist) (list value)))

;; Ivy
(ivy-mode)
(setq ivy-use-virtual-buffers t
      enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-rg)
(global-set-key (kbd "C-c n") 'counsel-fzf)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-c J") 'counsel-file-jump)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; Which-key
(setq which-key-idle-delay 0.5
      which-key-show-early-on-C-h t
      which-key-compute-remaps t
      which-key-sort-order 'which-key-local-then-key-order
      which-key-sort-uppercase-first nil
      which-key-unicode-correction 0
      which-key-side-window-max-height 0.5)

(which-key-mode)
(hide-minor-mode 'which-key-mode)

;; Theme
(load-theme 'nord t)

;; Mood line
(mood-line-mode)

;; Flymake
(setq flymake-mode-line-format nil
      flymake-suppress-zero-counters t)

(defun enable-flymake-in-buffer ()
  (unless buffer-read-only
    (flymake-mode)))

(defun enable-flymake ()
  "Enable `flymake-mode' if buffer is modifiable."
  (add-hook 'enable-flymake-hook
            #'enable-flymake-in-buffer
            nil t))

;; Eglot
(setq eglot-stay-out-of '(eldoc-documentation-strategy)
      eglot-autoshutdown t)

(advice-add #'eglot-completion-at-point
            :before-until #'inside-program-text-p)

(with-eval-after-load 'yasnippet
  (hide-minor-mode 'yas-minor-mode)
  (setq yas-minor-mode-map (make-sparse-keymap)))

(defun enable-eglot()
  "Enable eglot and its dependencies"
  (yas-minor-mode)
  (require 'eglot)
  (add-hook 'enable-eglot-hook #'eglot-ensure nil t))

;; This stops eglot from logging the json events of lsp server
(setq eglot-events-buffer-size 0)

;; Evil mode
(require 'evil)
(evil-mode 1)

;; Corfu
(setq tab-always-indent 'complete
      corfu-cycle t
      corfu-auto t)

(global-corfu-mode)

;; Python
(add-hook 'python-mode-hook #'enable-eglot)

;; Garbage collect when idle
(setq gcmh-idle-delay 'auto
      gcmh-auto-idle-delay-factor 10
      gcmh-high-cons-threshold (* 32 1024 1024))

(gcmh-mode)
(hide-minor-mode 'gcmh-mode)

(provide 'init)
;;; init.el ends here
