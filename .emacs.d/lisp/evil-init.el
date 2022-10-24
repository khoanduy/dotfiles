;;; evil-init.el -- Evil mode configuration
;;; Commentary:
;;; Code:
(defun rx-config-evil-leader ()
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "h"  'windmove-left
    "j"  'windmove-down
    "k"  'windmove-up
    "l"  'windmove-right

    "fb" 'helm-mini
    "ff" 'helm-projectile-find-file
    "fF" 'helm-find-files
    "fa" 'helm-projectile-rg
    "ps" 'helm-projectile-switch-project

    "sv" 'split-window-vertically
    "sh" 'split-window-horizontally

    "db" 'kill-this-buffer
    "ow" 'other-window
    "dw" 'delete-window
    "do" 'delete-other-windows

    "g"  'magit-status
    "w"  'save-buffer

    "fm"  'lsp-format-buffer

    "x"  'helm-M-x))

(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-keybinding nil)
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

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(provide 'evil-init)
;;; evil-init.el ends here
