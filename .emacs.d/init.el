(setq default-directory "~/")
(defconst lisp-path "~/.emacs.d/")
(add-to-list 'load-path lisp-path)

(prefer-coding-system 'utf-8-unix)

; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
    (with-current-buffer
              (url-retrieve-synchronously
                      "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
          (goto-char (point-max))
              (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(require 'init-smex)
(require 'init-autopair)

; (setq evil-emacs-state-modes nil)
; (evil-mode 1)

(yas-global-mode 1)

(require 'session)
; (desktop-save-mode 1)
(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(desktop-load-default)
(desktop-read)

(push "~/.runtime/bin" exec-path)
(setenv "PATH"
        (concat
         "~/.runtime/bin" ":"
         (getenv "PATH")
         ))

(if (eq system-type 'darwin)
    (progn
      (set-default-font "-unknown-Monaco-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
      ; (set-default-font "Monaco-14")
      )
  (set-default-font "-unknown-Ubuntu Mono-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
  )

(when (display-graphic-p)
  (progn
    (dolist (charset '(kana han symbol cjk-misc bopomofo gb18030))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family "Hiragino Sans GB" :size 14)))
    )
  )

(require 'linum)
(global-linum-mode t)
(setq linum-format "%4d ")
(setq auto-save-default nil)
(setq x-select-enable-clipboard t)
; follow symlinks
(setq vc-follow-symlinks nil)

(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/themes/blackboard-theme.el")

; hide toolbar
(if (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
; hide menu
(if (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(setq visible-bell t)

(setq-default tab-width 4)
(setq tab-stop-list (mapcar (lambda (x) (* x tab-width))
                            (number-sequence 1 40)))
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4
      sgml-basic-offset 4)

; 将yes/no替换为y/n
(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "RET") 'newline-and-indent)

;; (setq show-paren-style 'parenthesis)
;; (setq show-paren-delay 0)
(show-paren-mode t)
(set-face-bold-p 'show-paren-match t)
(set-face-foreground 'show-paren-match "red")
(set-face-background 'show-paren-match nil)
(setq line-move-visual nil)

;; recent
;; (require 'recentf)
(recentf-mode t)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(setq default-major-mode 'text-mode)
(setq-default make-backup-files nil)

; (display-time-mode t) ; 显示时间
(setq display-time-24hr-format t) ; 24小时格式
(setq display-time-day-and-date t) ; 显示日期

; (set-default-font "-unknown-Ubuntu Mono-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")
; (set-fontset-font "fontset-default" 'han '("WenQuanYi Bitmap Song" . "unicode-bmp"))
; (set-fontset-font "fontset-default" 'cjk-misc '("WenQuanYi Bitmap Song" . "unicode-bmp"))
; (set-fontset-font "fontset-default" 'bopomofo '("WenQuanYi Bitmap Song" . "unicode-bmp"))
; (set-fontset-font "fontset-default" 'gb18030 '("WenQuanYi Bitmap Song". "unicode-bmp"))
; (set-fontset-font "fontset-default" 'symbol '("WenQuanYi Bitmap Song". "unicode-bmp"))
; (add-to-list 'default-frame-alist '(font . "-unknown-Ubuntu Mono-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1"))

; Keybonds
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)
; (setq mac-command-modifier 'hyper)

; mac switch meta key
(defun mac-switch-meta nil
  "switch meta between Option and Command"
  (interactive)
  (if (eq mac-option-modifier nil)
    (progn
      (setq mac-option-modifier 'meta)
      (setq mac-command-modifier 'hyper)
      )
    (progn
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta)
      )
    )
  )

