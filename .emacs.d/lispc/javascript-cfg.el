;;; javascript-cfg.el --- Javascript configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package web-mode
  :mode
  ("\\.ejs\\'" "\\.hbs\\'" "\\.html\\'" "\\.[jt]sx?\\'")
  :config
  (setq web-mode-content-types-alist '(("jsx" . "\\.[jt]sx?\\'")))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-block-padding 2)
  (setq web-mode-style-padding 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-current-element-highlight t))

(use-package js2-mode
  :mode
  (("\\.js\\'" . js2-mode))
  :hook ((js2-mode . lsp)
	 (js2-mode . webmode))
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
  :hook ((typescript-mode . lsp)
	 (typescript-mode . web-mode))
  :bind (("M-." . lsp-find-definition)))

(use-package add-node-modules-path)

(provide 'javascript-cfg)
;;; javascript-cfg.el ends here
