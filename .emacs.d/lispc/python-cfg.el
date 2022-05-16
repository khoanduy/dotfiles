;;; python-cfg.el --- Python configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package py-autopep8
  :bind (("C-M-\\" . py-autopep8-buffer))
  :config
  (setq py-autopep8-options '("--max-line-length=80")))

(use-package pyvenv)

(use-package elpy
  :init
  (elpy-enable)
  :hook ((elpy-mode . company-mode)
         (elpy-mode . flycheck-mode)))

(provide 'python-cfg)
;;; python-cfg.el ends here
