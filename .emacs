(setq default-directory "~/")
(defconst lisp-path "~/.emacs.d/")
(add-to-list 'load-path lisp-path)

(prefer-coding-system 'utf-8-unix)
(set-default-font "-unknown-Ubuntu Mono-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")
(require 'linum)
(global-linum-mode t)
(setq linum-format "%4d ")
(setq auto-save-default nil)
(setq x-select-enable-clipboard t)

(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/themes/blackboard-theme.el")
; (color-theme-blackboard)
 
(setq-default tab-width 4)
(setq tab-stop-list (mapcar (lambda (x) (* x tab-width))
                            (number-sequence 1 40)))
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4
      sgml-basic-offset 4)
(fset 'yes-or-no-p 'y-or-n-p)

;; recent
;; (require 'recentf)
(recentf-mode t)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(setq default-major-mode 'text-mode)
(setq-default make-backup-files nil)

; (set-default-font "-unknown-Ubuntu Mono-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")
; (set-fontset-font "fontset-default" 'han '("WenQuanYi Bitmap Song" . "unicode-bmp"))
; (set-fontset-font "fontset-default" 'cjk-misc '("WenQuanYi Bitmap Song" . "unicode-bmp"))
; (set-fontset-font "fontset-default" 'bopomofo '("WenQuanYi Bitmap Song" . "unicode-bmp"))
; (set-fontset-font "fontset-default" 'gb18030 '("WenQuanYi Bitmap Song". "unicode-bmp"))
; (set-fontset-font "fontset-default" 'symbol '("WenQuanYi Bitmap Song". "unicode-bmp"))
; (add-to-list 'default-frame-alist '(font . "-unknown-Ubuntu Mono-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1"))
