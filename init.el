;;; init.el --- rogs Emacs configuration
;;
;;; Commentary:
;;
;; This is my basic configuration for Emacs as text editor.
;; It is mainly focused on Web Development with JS, React, Django and Node
;;
;;; Code:

(setq user-full-name "Roger González")
(setq user-mail-address "roger@rogs.me")

(package-initialize)

;; Define Folders
(defvar core-dir (expand-file-name "core" user-emacs-directory)
  "Directory containing core configuration.")

(defvar setup-dir (expand-file-name "setup" user-emacs-directory)
  "Directory containing modes configuration.")

(add-to-list 'load-path core-dir)
(add-to-list 'load-path setup-dir)

;; Load core configurations
(require 'rogs-core)
(require 'rogs-packages)
(require 'rogs-ui)
(require 'rogs-keybindings)

;; Load modes configurations
(require 'setup-web-mode)
(require 'setup-js-mode)
(require 'setup-flycheck-mode)
(require 'setup-yaml-mode)
(require 'setup-python-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (hemisu-theme company-jedi elpy all-the-icons page-break-lines dashboard dockerfile-mode prettier-js add-node-modules-path stylus-mode yasnippet-snippets indium company-lsp lsp-ui lsp-mode yaml-mode mocha company-tern xref-js2 js2-refactor ac-js2 skewer-mode js2-mode coverage restclient emojify helm-flycheck pug-mode helm-swoop helm react-snippets yasnippet whitespace-cleanup-mode web-mode web-beautify scss-mode sass-mode rjsx-mode rainbow-mode rainbow-delimiters projectile project-explorer powerline nyan-mode neotree markdown-mode magit-gitflow kooten-theme json-mode jedi indent-guide geeknote flycheck exec-path-from-shell emmet-mode bundler aggressive-indent))))
