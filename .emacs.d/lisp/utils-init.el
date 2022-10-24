;;; utils-init.el -- Utilities configuration
;;; Commentary:
;;; Code:
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :ensure t
  :defer t
  :if (display-graphic-p))

(use-package kaolin-themes
  :ensure t
  :config
  (load-theme 'kaolin-galaxy t)
  (kaolin-treemacs-theme))

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'respectful)
  (sml/setup))

(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

(use-package magit
  :ensure t
  :defer t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (setq projectile-enable-caching t)
  (setq projectile-mode-line
        '(:eval
          (format " Prj[%s]"
                  (projectile-project-name)))))

(use-package helm
  :ensure t
  :preface (require 'helm-config)
  :diminish helm-mode
  :commands helm-mode
  :bind (("<tab>" . helm-execute-persistent-action))
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 29))

(use-package helm-projectile
  :ensure t
  :defer t
  :commands (helm-projectile helm-projectile-switch-project))

(use-package helm-rg
  :ensure t)

(provide 'utils-init)
;;; utils-init.el ends here
