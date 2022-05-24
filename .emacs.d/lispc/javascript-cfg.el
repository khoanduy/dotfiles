;;; javascript-cfg.el --- Javascript configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package js2-mode
  :mode
  (("\\.js\\'" . js2-mode))
  :custom
  (js2-include-node-externs t)
  (js2-highlight-level 3)
  (js2r-prefer-let-over-var t)
  (js2r-prefered-quote-type 2)
  (js-indent-align-list-continuation t)
  (global-auto-highlight-symbol-mode t)
  :hook ((js2-mode . company-mode)
         (js2-mode . flycheck-mode))
  :config
  (with-eval-after-load 'js
    (sanityinc/major-mode-lighter 'js-mode "JS")
    (sanityinc/major-mode-lighter 'js-jsx-mode "JSX"))
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

(provide 'javascript-cfg)
;;; javascript-cfg.el ends here
