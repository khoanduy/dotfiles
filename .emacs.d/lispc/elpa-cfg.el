;;; elpa-cfg.el --- MELPA configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

;; Install into separate directory for different Emacs version
(setq package-user-dir
      (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                        user-emacs-directory))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(provide 'elpa-cfg)
;;; elpa-cfg.el ends here
