;;; lsp-init.el -- LSP configuration
;;; Commentary:
;;; Code:
(use-package lsp-mode
  :ensure t
  :hook ((rust-mode . lsp)
         (lsp-mode . lsp-ui-mode)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :custom
  (lsp-modeline-diagnostics-enable t)
  (lsp-completion-show-detail t)
  (lsp-completion-show-kind t)
  (lsp-modeline-code-actions-enable nil)
  (lsp-completion-show-detail nil)
  (lsp-headerline-breadcrumb-segments nil)
  :config
  (with-eval-after-load 'lsp-mode
    (setq lsp-modeline-diagnostics-scope :workspace))

  (add-hook 'lsp-mode-hook
          (lambda ()
            (evil-define-key 'normal lsp-mode-map (kbd "gd") 'lsp-find-definition)
            (evil-define-key 'normal lsp-mode-map (kbd "gr") 'lsp-find-references)
            (evil-define-key 'normal lsp-mode-map (kbd "gi") 'lsp-find-implementation))))

(use-package dap-mode
  :ensure t)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-enable nil))

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

(provide 'lsp-init)
;;; lsp-init.el ends here
