;;; lang-init.el -- Language-specific configuration
;;; Commentary:
;;; Code:

;; Tree sitter
; (use-package tree-sitter-langs
  ; :ensure t)

; (use-package tree-sitter
  ; :ensure t
  ; :config
  ; (global-tree-sitter-mode))

;; Rust
(use-package rust-mode
  :ensure t)

(provide 'lang-init)
;;; lang-init.el ends here
