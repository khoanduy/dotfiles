;;; evil-init.el -- Evil mode configuration
;;; Commentary:
;;; Code:
(defun rx-config-evil-leader ()
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "fb" 'helm-mini
    "ff" 'helm-projectile-find-file
    "fF" 'helm-find-files
    "fa" 'helm-projectile-rg
    "sp" 'helm-projectile-switch-project
    "kb" 'kill-this-buffer
    "do" 'delete-other-windows
    "g"  'magit-status
    "w"  'save-buffer
    "x"  'helm-M-x))

(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1)

  (use-package undo-fu
    :ensure t)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (rx-config-evil-leader))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode)))

(provide 'evil-init)
;;; evil-init.el ends here
