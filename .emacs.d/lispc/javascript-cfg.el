;;; javascript-cfg.el --- Javascript configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package js2-mode
  :mode
  (("\\.js\\'" . js2-mode)
   ("\\.jsx\\'" . js2-jsx-mode))
  :hook ((js2-mode . lsp))
  :bind (:map js2-mode-map
	 ("M-." . lsp-find-definition))
  :config
  (setq js-indent-level 2)
  (setq js2-basic-offset 2))

(use-package json-mode
  :custom
  (json-reformat:indent-width 2)
  :mode (("\\.bowerrc$"     . json-mode)
         ("\\.jshintrc$"    . json-mode)
         ("\\.json_schema$" . json-mode)
         ("\\.json\\'" . json-mode))
  :bind (:package json-mode-map
         :map json-mode-map
         ("C-M \\" . json-mode-beautify)))

(use-package typescript-mode
  :hook ((typescript-mode . lsp))
  :bind (("M-." . lsp-find-definition)))

(use-package prettier-js)

(provide 'javascript-cfg)
;;; javascript-cfg.el ends here
