;;; early-init.el --- emacs configuration file -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; Some config have to load before the package system and GUI is initialized
;;
;;; Code:

;; Stop pacakge loading
(setq package-enable-at-startup nil)

(provide 'early-init)
;;; early-init.el ends here
