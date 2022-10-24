;;; code-init.el -- Code-related configuration
;;; Commentary:
;;; Code:
(use-package yasnippet
  :ensure t
  :defer t
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(use-package yasnippet-snippets
  :ensure t
  :defer t)

(use-package flycheck
  :ensure t
  :defer t
  :init (global-flycheck-mode)
  :config
  (setq flycheck-idle-change-delay 0.8))

(use-package company
  :ensure t
  :defer t
  :bind (:map company-active-map
	            ("C-n". company-select-next)
	            ("C-p". company-select-previous)
	            ("<escape>". company-abort))
	      (:map company-mode-map
	            ("<tab>". tab-indent-or-complete))
  :config
  (setq company-backends '((company-capf :with company-yasnippet)))
  (setq company-idle-delay 0.5)
  (setq company-selection-wrap-around t)

  (global-company-mode))

(use-package rust-mode
  :ensure t)

(use-package yaml-mode
  :ensure t
  :mode "\\(?:\\(?:\\.y\\(?:a?ml\\)\\)\\)\\'")

(provide 'code-init)
;;; code-init.el ends here
