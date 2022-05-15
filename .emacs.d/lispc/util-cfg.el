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

;; Projectile
(use-package projectile
  :init
  (projectile-global-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

;; Helm
(use-package helm
  :demand t
  :after projectile
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

;; Helm Projectile
(use-package helm-projectile
  :after helm
  :config
  (helm-projectile-on))

;; Magit
(use-package magit
  :bind (("C-x g" . magit)))

(provide 'util-cfg)
;;; util-cfg.el ends here
