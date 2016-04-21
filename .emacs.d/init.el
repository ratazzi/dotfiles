(prefer-coding-system 'utf-8-unix)
(require 'linum)
(global-linum-mode t)
(setq linum-format "%4d ")
(setq auto-save-default nil)
(setq x-select-enable-clipboard t)
; follow symlinks
(setq vc-follow-symlinks nil)
; no backup files
(setq make-backup-files nil)

(defvar my-packages '(better-defaults smex powerline session
                                      fzf smyx-theme yasnippet
                                      evil evil-leader evil-matchit
                                      evil-search-highlight-persist
                                      smartparens evil-smartparens
                                      powerline-evil ag flycheck
                                      window-numbering web-mode
                                      multi-term
                                      ))

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

; install missing packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

; (add-to-list 'package-archives
;   '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(load-theme 'smyx t)

;; Font Setting
; https://github.com/cedricporter/vim-emacs-setting/blob/master/emacs/.emacs.d/configs/my-ui.el
(setq my-font "Monaco-14")
(if (member "Monaco" (font-family-list))
    (progn
      (if (string= (system-name) "Stupid-ET.local") ; for retina
      (setq my-font "Monaco-11")
      ))
  (if (member "Consola" (font-family-list))
      (setq my-font "Consolas-11")))


(add-to-list 'default-frame-alist
             '(font . my-font))

(defun frame-setting ()
  ;; English Font
  (set-frame-font my-font)

  ;; http://baohaojun.github.com/perfect-emacs-chinese-font.html
  ;; Chinese Font，太大了，除了在表格的地方用到，其他地方严重影响视觉。
  (if (display-graphic-p)
    (progn
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
                          charset (font-spec :family "WenQuanYi Micro Hei Mono"
                                             ;; :size 15  ; 18
                                             )))
      ;; Fix rescale
      (setq face-font-rescale-alist '(("Microsoft Yahei" . 1.2) ("WenQuanYi Micro Hei Mono" . 1.2)))
      )
    )
  )
(frame-setting)

; hide toolbar
(if (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
; hide menu
(if (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(setq visible-bell t)

; soft tabs
(setq indent-tabs-mode nil)

(setq-default tab-width 4)
(setq tab-stop-list (mapcar (lambda (x) (* x tab-width))
  (number-sequence 1 40)))
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4
      sgml-basic-offset 4)

; 将yes/no替换为y/n
(fset 'yes-or-no-p 'y-or-n-p)

; (set-keyboard-coding-system nil)
(setq mac-command-key-is-meta nil)
(setq mac-command-modifier 'hyper)
(setq mac-option-key-is-meta t)
(setq mac-option-modifier 'meta)
(global-set-key (kbd "RET") 'newline-and-indent)

;; (setq show-paren-style 'parenthesis)
;; (setq show-paren-delay 0)
(show-paren-mode t)
(set-face-bold-p 'show-paren-match t)
(set-face-foreground 'show-paren-match "red")
(set-face-background 'show-paren-match nil)
(setq line-move-visual nil)

; eval region
(define-key emacs-lisp-mode-map (kbd "C-x C-r") 'eval-region)
(define-key lisp-interaction-mode-map (kbd "C-x C-r") 'eval-region)

(setq default-major-mode 'text-mode)

; (display-time-mode t) ; 显示时间
(setq display-time-24hr-format t) ; 24小时格式
; (setq display-time-day-and-date t) ; 显示日期

(add-hook 'find-file-hook
          (lambda ()
            (setq default-directory command-line-default-directory)))

; Keybonds
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(require 'evil)
(evil-mode t)
(setq evil-default-state 'normal)

;; ESC to switch back normal-state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(global-evil-leader-mode)
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states t)

; (setcdr evil-insert-state-map nil)
; (define-key evil-insert-state-map
;   (read-kbd-macro evil-toggle-key) 'evil-emacs-state)

; Vim-like search highlighting
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)
; http://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/
(evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)

;; esc quits
(defun minibuffer-keyboard-quit ()
    "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
        (setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
(define-key evil-normal-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-normal-state-map "\C-b" 'evil-backward-char)
(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
; (define-key evil-normal-state-map "\C-d" 'evil-delete-char)
; (define-key evil-insert-state-map "\C-d" 'evil-delete-char)
; (define-key evil-visual-state-map "\C-d" 'evil-delete-char)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-visual-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
(define-key evil-normal-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
(define-key evil-visual-state-map "\C-w" 'evil-delete)
(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)
(define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
(define-key evil-visual-state-map "Q" 'call-last-kbd-macro)
(define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)
(define-key evil-visual-state-map "\C-r" 'isearch-backward)
(define-key evil-visual-state-map "\C-S-r" 'tags-apropos)
; (global-set-key (kbd "C-r") 'isearch-backward)
; (global-set-key (kbd "C-S-r") 'tags-apropos)

(defun evil-undefine ()
  (interactive)
  (let (evil-mode-map-alist)
       (call-interactively (key-binding (this-command-keys)))))

; http://nathantypanski.com/blog/2014-08-03-a-vim-like-emacs-config.html
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

; Vim's set paste
;; From http://stackoverflow.com/questions/18691973/is-there-a-set-paste-option-in-emacs-to-paste-paste-from-external-clipboard
(defvar ttypaste-mode nil)
(add-to-list 'minor-mode-alist '(ttypaste-mode " Paste"))
(defun ttypaste-mode ()
  (interactive)
  (let ((buf (current-buffer))
    (ttypaste-mode t))
    (with-temp-buffer
      (let ((stay t)
        (text (current-buffer)))
    (redisplay)
    (while stay
      (let ((char (let ((inhibit-redisplay t)) (read-event nil t 0.1))))
        (unless char
          (with-current-buffer buf (insert-buffer-substring text))
          (erase-buffer)
          (redisplay)
          (setq char (read-event nil t)))
        (cond
         ((not (characterp char)) (setq stay nil))
         ((eq char ?\r) (insert ?\n))
         ((eq char ?\e)
          (if (sit-for 0.1 'nodisp) (setq stay nil) (insert ?\e)))
         (t (insert char)))))
    (insert-buffer-substring text)))))

(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

(require 'powerline)
(setq powerline-default-separator nil)

(require 'airline-themes)
(load-theme 'airline-powerlineish t)

(setq airline-utf-glyph-separator-left      #x00bb
      airline-utf-glyph-separator-right     #x00ab
      airline-utf-glyph-subseparator-left   #x00bb
      airline-utf-glyph-subseparator-right  #x00ab
      airline-utf-glyph-branch              #x2387
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #x00b6
      powerline-utf-8-separator-left        #x00bb
      powerline-utf-8-separator-right       #x00ab
      )

(require 'smartparens-config)
;; Always start smartparens mode in js-mode.
(add-hook 'js-mode-hook #'smartparens-mode)

(require 'session)
(setq session-jump-undo-threshold 80)  ; default was 240
(global-set-key [(control ?.)] 'session-jump-to-last-change)

; fzf
(evil-leader/set-key "p" 'fzf)

;; Ctrl-c ← for last window layout
(when (fboundp 'winner-mode)
  (winner-mode)
    (windmove-default-keybindings))

(require 'window-numbering)
(window-numbering-mode t)
; (setq window-numbering-assign-func
;       (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

; snippets
(require 'yasnippet)
(yas-global-mode t)

(require 'flycheck)
(global-flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

(add-hook 'after-init-hook 'global-company-mode)

(autoload 'jedi:setup "jedi" nil t)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook 'run-python-internal)

(require 'web-mode)
(setq web-mode-enable-engine-detection t)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
; plain html
; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-to-list 'auto-mode-alist '("/\\(views\\|html\\|templates\\)/.*\\.php\\'" . web-mode))

;; for shell
;; (setq shell-file-name "/usr/bin/zsh")
(setq explicit-shell-file-name "/usr/bin/fish")
(setq shell-file-name "zsh")
; (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

;; ctrl-d for shell
(add-hook 'shell-mode-hook 'wcy-shell-mode-hook-func)
(defun wcy-shell-mode-hook-func ()
  (set-process-sentinel (get-buffer-process (current-buffer))
                        #'wcy-shell-mode-kill-buffer-on-exit)
  )
(defun wcy-shell-mode-kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))

(require 'multi-term)
(if (eq system-type 'darwin)
    (setq multi-term-program "/bin/zsh")
  )
(if (eq system-type 'gnu/linux)
    (setq multi-term-program "/usr/bin/zsh")
  )
(setq system-uses-terminfo nil)

(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))

(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 0)))

(add-hook 'term-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)
            (autopair-mode -1)))

(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

; (add-hook 'term-mode-hook
;           (lambda()
;             (global-unset-key (kbd "C-r"))
;             ; (local-unset-key (kbd "C-r"))
;             (message "%s" "This is in term mode and hook enabled.")
;             ))

(defcustom term-unbind-key-list
  '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>")
  "The key list that will need to be unbind."
  :type 'list
  :group 'multi-term)

(defcustom term-bind-key-alist
  '(
    ("C-c C-c" . term-interrupt-subjob)
    ("C-p" . previous-line)
    ("C-n" . next-line)
    ("C-s" . isearch-forward)
    ("C-r" . isearch-backward)
    ("C-m" . term-send-raw)
    ("M-f" . term-send-forward-word)
    ("M-b" . term-send-backward-word)
    ("M-o" . term-send-backspace)
    ("M-p" . term-send-up)
    ("M-n" . term-send-down)
    ("M-M" . term-send-forward-kill-word)
    ("M-N" . term-send-backward-kill-word)
    ("M-r" . term-send-reverse-search-history)
    ("M-," . term-send-input)
    ("M-." . comint-dynamic-complete))
  "The key alist that will need to be bind.
If you do not like default setup, modify it, with (KEY . COMMAND) format."
  :type 'alist
  :group 'multi-term)
; (add-to-list 'term-bind-key-alist '("C-d"))

(require 'ag)
(setq ag-highlight-search t)
(setq ag-reuse-window 't)
(setq ag-reuse-buffers 't)

(require 'etags-table)
(require 'etags-select)
(setq etags-table-search-up-depth 10)
; (global-set-key "\M-." 'etags-select-find-tag)
(evil-leader/set-key "t" 'etags-select-find-tag-at-point)

(require 'git-gutter)
(global-git-gutter-mode t)
(git-gutter:linum-setup)
(add-hook 'ruby-mode-hook 'git-gutter-mode)
(add-hook 'python-mode-hook 'git-gutter-mode)

(custom-set-variables
 '(git-gutter:modified-sign "~") ;; two space
 '(git-gutter:added-sign "+")    ;; multiple character is OK
 '(git-gutter:deleted-sign "-"))

(provide 'init)
