;;; rust-cfg.el --- Rust configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package rust-mode
  :hook ((rust-mode . (lambda() (setq indent-tabs-mode nil)))
	 (rust-mode . lsp))
  :config
  (setq rust-format-on-save t)
  (setq lsp-rust-server 'rust-analyzer)
  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.2)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-closure-return-type-hints t))

(provide 'rust-cfg)
;;; rust-cfg.el ends here
