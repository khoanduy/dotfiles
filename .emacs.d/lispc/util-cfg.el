;;; util-cfg.el --- utility configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Exec PATH from shell
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; Terminal
(use-package term
  :bind (("C-c t" . term)
         :map term-mode-map
         ("M-p" . term-send-up)
         ("M-n" . term-send-down)
         :map term-raw-map
         ("M-o" . other-window)
         ("M-p" . term-send-up)
         ("M-n" . term-send-down)))

;; Theme
(use-package kaolin-themes
  :config
  (load-theme 'kaolin-light t))

;; Sublimity
(use-package sublimity
  :config
  (require 'sublimity-scroll)
  (require 'sublimity-attractive)
  (sublimity-mode 1)
  )

;; Projectile
(use-package projectile
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

;; Helm
(use-package helm
  :demand t
  :init
  (setq helm-command-prefix-key "C-c h")
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("C-x c o" . helm-occur)
         ("M-y" . helm-show-kill-ring)
         ("C-x r b" . helm-filtered-bookmarks)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
         ("C-z" . helm-select-action))
  :config
  (require 'helm-config)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-split-window-in-side-p t)
  (setq helm-move-to-line-cycle-in-source t)
  (setq helm-ff-search-library-in-sexp t)
  (setq helm-scroll-amount 8)
  (setq helm-ff-file-name-history-use-recentf t)
  (setq helm-echo-input-in-header-line t)
  (setq projectile-completion-system 'helm)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 20)
  (helm-autoresize-mode 1)
  (helm-mode 1))

;; Helm Ag
(use-package helm-ag
  :bind (("C-c p s i" . helm-grep-do-git-grep)
         ("C-c p s a" . helm-do-grep-ag)))

;; Helm Projectile
(use-package helm-projectile
  :after (helm projectile)
  :config
  (helm-projectile-on))

;; Which key
(use-package which-key
  :config
  (which-key-mode 1))

;; Magit
(use-package magit
  :bind (("C-x g" . magit)))

;; Flycheck
(use-package flycheck
  :init (global-flycheck-mode))

;; Company
(use-package company
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.2)
  (global-company-mode t))

;; Company quickhelp
(use-package company-quickhelp
  :after company
  :config
  (company-quickhelp-mode t))

;; Recentf
(use-package recentf
  :config
  (setq recentf-auto-cleanup 'never
        recentf-max-saved-items 1000
        recentf-save-file (concat user-emacs-directory ".recentf"))
  (recentf-mode t)
  :diminish nil)

;; LSP
(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-auto-guess-root t)
  (lsp-enable-completion-at-point t)
  (lsp-keep-workspace-alive nil)
  (lsp-auto-execute-action nil))

;; Helm LSP
(use-package helm-lsp
  :after (helm lsp-mode)
  :commands helm-lsp-workspace-symbol)

(provide 'util-cfg)
;;; util-cfg.el ends here
