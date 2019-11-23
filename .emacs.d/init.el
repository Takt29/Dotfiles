(require 'cask "/usr/local/opt/cask/cask.el")
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(cask-initialize)

(setenv "LANG" "en_US.UTF-8")

;;-----------------------
;; Window size
;;-----------------------
(setq default-frame-alist
      '((width . 85) (height . 58)))

;;-----------------------
;; Font size
;;-----------------------

;;Japanese
(set-fontset-font "fontset-default"
                  'japanese-jisx0208
                  '("Osaka"))

;;-----------------------
;; Line Number
;;-----------------------
(global-display-line-numbers-mode t)

;;-----------------------
;; Don't show Start Page
;;-----------------------
(setq inhibit-startup-message t)

;;-----------------------
;; Don't show Scroll Bar
;;-----------------------
(set-scroll-bar-mode nil)

;;-----------------------
;; Share Copy & Paste
;;-----------------------
(setq x-select-enable-clipboard t)

;;-----------------------
;; Undo & Redo
;;-----------------------
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;;-----------------------
;; indent
;;-----------------------
(setq-default indent-tabs-mode nil) ;; オートインデントでスペースを使う
(setq default-tab-width 2)
(setq js-indent-level 2)
(setq css-indent-offset 2)
(setq c-basic-offset 2)

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;;保存時に末尾の空白を削除

;;-----------------------
;; web-mode
;;-----------------------
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

;; web-modeの設定
(defun web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-engines-alist
        '(("php"    . "\\.ctp\\'")
          ("blade"  . "\\.blade\\."))
        )
  )

(add-hook 'web-mode-hook  'web-mode-hook)

;; 色の設定
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "#C9E5C8"))))
 '(web-mode-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF"))))
 '(web-mode-doctype-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#C97586"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-tag-face ((t (:foreground "#E6B422" :weight bold))))
 '(web-mode-server-comment-face ((t (:foreground "#D9333F")))))

;;-----------------------
;; yasnippet
;;-----------------------
(require 'yasnippet)
;; ;; C++
(add-hook 'c++-mode-hook
          '(lambda ()
             (yas-global-mode t)))

;;-----------------------
;; Company Mode
;;-----------------------

(require 'company)

(global-company-mode)

(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(setq company-idle-delay 0.05)
(setq completion-ignore-case t)
(setq company-transformers '(company-sort-by-backend-importance))

;; 1つでもtooltipを表示
(setq company-frontends '(company-pseudo-tooltip-frontend
                          company-echo-metadata-frontend))


; YASnippet in Company
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")
(defun company-mode/backend-with-yas (backend)
  (if (or
       (not company-mode/enable-yas)
       (and (listp backend) (member 'company-yasnippet backend))
       )
      backend
    (append (if (consp backend) backend (list backend))
	    '(:with company-yasnippet))))

(defun set-yas-as-company-backend ()
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
)
(add-hook 'company-mode-hook 'set-yas-as-company-backend)

;;-----------------------
;; Flymake
;;-----------------------
(require 'flymake)

;; ;; C++
(add-hook 'c++-mode-hook
          '(lambda ()
             (flymake-mode t)))
;; ;; C
(add-hook 'c-mode-hook
          '(lambda ()
             (flymake-mode t)))

;;-----------------------
;; Character Setting
;;-----------------------
(define-key global-map [?¥] [?\\])

;;-----------------------
;; Key Setting
;;-----------------------

;;Ctrl <-> Option
(setq ns-control-modifier (quote meta))
(setq ns-option-modifier (quote C))

;;-----------------------
;; Highlight
;;-----------------------

;; 現在行をハイライト
(global-hl-line-mode t)

;; 括弧をハイライト
(show-paren-mode t)

;;-----------------------
;; Footer
;;-----------------------
(which-function-mode 1) ;;show function name

;;-----------------------
;; auto-save
;;-----------------------

(setq delete-auto-save-files t)
