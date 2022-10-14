;;; utils-init.el -- Utilities configuration
;;; Commentary:
;;; Code:

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
  (load-theme 'kaolin-dark t)
  (kaolin-treemacs-theme))

(provide 'utils-init)
;;; utils-init.el ends here
