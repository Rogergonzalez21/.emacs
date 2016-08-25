;; Basic: User
(setq user-full-name "Roger González")
(setq user-mail-address "rogergonzalez21@gmai.com")

;; Basic: Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(custom-set-faces)

;; Theme
(load-theme 'badwolf t)

;; Saves emacs backups in other folder
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs_backups"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; Line number
(global-linum-mode 1)
(line-number-mode 1)

;; Column number
(column-number-mode 1)
(ac-config-default)

;; WhiteSpace Cleanup
(global-whitespace-cleanup-mode)

;; Selection highlight
(delete-selection-mode 1)

;; Parentesis highlight
(show-paren-mode 1) 

;; NO scrollbar, NO toolbar NO menubar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Basic: Maximize Buffer
(when (fboundp 'winner-mode)
(winner-mode 1))

;; F5 = Goto
(global-set-key [f5] 'goto-line)

;; Removes mouse from code
(mouse-avoidance-mode "animate")

;; Web Mode: Begin
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))

;; WebMode: Style-Gook
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)
  )

;; WebMode: Emmet-Hook
(add-hook 'web-mode-before-auto-complete-hooks
          '(lambda ()
             (let ((web-mode-cur-language
                    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "css")
                   (setq emmet-use-css-transform t)
                 (setq emmet-use-css-transform nil)))))

;; Indent
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq js-indent-level 2)
(setq js-highlight-level 3)

(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'web-mode-hook 'my-web-mode-hook)
(add-hook 'web-mode-hook #'emmet-mode)
(setq emmet-preview-default t)
(add-hook 'web-mode-hook 'rainbow-mode)

;; Tabs with spaces
(setq-default indent-tabs-mode nil)

;; Powerline
(require 'powerline)
(powerline-default-theme)
(custom-set-faces
 '(powerline-arrow-shape 'arrow)
 '(mode-line ((t (:foreground "#030303" :background "#6d0204" :box nil))))
 '(mode-line-inactive ((t (:foreground "#ffffff" :background "#5d6365" :box nil))))
 '(powerline-active1 ((t (:foreground "#f9f9f9" :background "#ff6365" :box nil))))
 '(powerline-active2 ((t (:foreground "#f9f9f9" :background "#5d6365" :box nil))))
 '(mode-line-buffer-id ((t (:foreground "#000000" :bold t))))
)

;; Org-Mode
;; Auto Org-Mode

(setq org-todo-keyword-faces
      '(
        ("SOMEDAY" . (:foreground "blue"))
        ("CANCELED" . (:foreground "yellow"))
        ("WAITING" . (:foreground "purple"))
        ("NEXT DAY" . (:foreground "white"))
        ("DONE" . (:foreground "green"))
        ))
(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "SOMEDAY" "CANCELED" "NEXT DAY" "DONE")))
(find-file "~/Dropbox/emacs/todo.org")

;; Org-clock
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Delete selection mode
(delete-selection-mode 1)

;; NeoTree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Magit
(global-set-key [f7] 'magit-status)
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; Desktop save Mode
(desktop-save-mode 1)
