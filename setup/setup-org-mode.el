;;; setup-org-mode.el --- rogs default org mode configuration
;;
;;; Commentary:
;;
;; My default configuration for org mode
;;
;;; Code:

(setq org-agenda-files (quote ("~/Documentos/Org")))

;;; Keyword and faces
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "WAITING(w)" "IN_PROGRESS(p)" "SOMEDAY(s)" "|" "DONE(d!)")
              (sequence "INFO(i@)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("WAITING" :foreground "#00C5DB" :weight bold)
              ("IN_PROGRESS" :foreground "orange" :weight bold)
              ("SOMEDAY" :foreground "magenta" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("INFO" :foreground "blue" :weight bold))))

(setq org-time-stamp-custom-formats '("<%d/%m/%y %a>" . "<%d/%m/%y %a %H:%M>"))
(setq org-display-custom-times t)

(provide 'setup-org-mode)
;;; setup-org-mode.el ends here
