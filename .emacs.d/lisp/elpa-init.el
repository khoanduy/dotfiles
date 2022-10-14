;;; elpa-init.el -- ELPA Initialization
;;; Commentary:
;;; Code:
(require 'package)

;;; Standard package repositories
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

;; Don't do this, because I already did it in init.el
(setq package-enable-at-startup nil)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(provide 'elpa-init)
;;; elpa-init.el ends here
