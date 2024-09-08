;; --- STRAIGHT PACKAGE MANAGER SETUP ---

;; Bootstrap straight.el, the package manager
(defvar bootstrap-version)
(let ((bootstrap-file
 (expand-file-name "straight/repos/straight.el/bootstrap.el"
   (or (bound-and-true-p straight-base-dir)
       user-emacs-directory)))
(bootstrap-version 7))
(unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
           "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
(load bootstrap-file nil 'nomessage))

;; --- PACKAGE INSTALLATIONS ---

;; Install and configure nano-theme (minimal theme)
(straight-use-package '(nano-theme :type git :host github :repo "rougier/nano-theme"))

;; Install and configure olivetti for distraction-free writing
(straight-use-package '(olivetti :type git :host github :repo "rnkn/olivetti"))

(require 'olivetti)
(add-hook 'org-mode-hook 'olivetti-mode)  ;; Enable olivetti-mode in Org files

;; --- CUSTOMIZE PART ---

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(nano-light))
 '(custom-safe-themes
   '("c0fe7e641d584b8d38e4d1b91c916530022d51e80f301c4d2387da67cfe7cef8" default))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight regular :height 120 :width normal)))))

;; --- ORG MODE CONFIGURATION ---

;; Load Org mode
(require 'org)

;; Define key bindings for Org mode functions
(define-key global-map "\C-cl" 'org-store-link)  ;; C-c l to store a link
(define-key global-map "\C-ca" 'org-agenda)      ;; C-c a to open the agenda

;; Set the agenda files (adjust path to your system)
(setq org-agenda-files (list "C:/Users/valen/org-mode/misc.org"))

;; Customize fringe appearance in olivetti
(set-face-attribute 'olivetti-fringe nil :background "white smoke")
(setq olivetti-style 'fancy)  ;; Set olivetti style to 'fancy'

(add-hook 'olivetti-mode-on-hook (lambda () (olivetti-set-width 100))) 
(setq org-tags-column -100)

;; Install and configure org-superstar-mode for better heading bullets
(straight-use-package '(org-superstar-mode :type git :host github :repo "integral-dw/org-superstar-mode"))

(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))  ;; Enable org-superstar in Org files

;; Customize heading bullets in org-superstar-mode
(setq org-superstar-headline-bullets-list '("○" "►" "▪" "▫" "▫" "▫" "▫" "▫"))

;; --- TEXT ENCODING SETTINGS ---

;; Set Emacs to use UTF-8 encoding for reading and writing files
(prefer-coding-system 'utf-8-unix)
(setq coding-system-for-read 'utf-8-unix)
(setq coding-system-for-write 'utf-8-unix)

;; --- ORG MODE CUSTOMIZATIONS ---

;; Display heading levels as numbered, up to level 2
(setq org-startup-numerated t)
(setq org-num-max-level 2)

;; --- ORG TODO & DONE CUSTOMIZATION ---

;; Customize the 'TODO' keyword face
(set-face-attribute 'org-todo nil
    :foreground "orange red"
    :weight 'bold)

;; Customize the 'DONE' keyword face
(set-face-attribute 'org-done nil
    :foreground "sea green"
    :weight 'bold
    :strike-through t)

;; Add strike-through to DONE headlines
(set-face-attribute 'org-headline-done nil
    :strike-through t)

;; Enable fontification for DONE headlines
(setq org-fontify-done-headline t)

;; --- ORG MODE HEADING LEVEL CUSTOMIZATION ---

;; Customize the appearance of heading levels in Org mode
(set-face-attribute 'org-level-1 nil
    :foreground "white"
    :background "black"
    :height 1.1
    :weight 'bold)

(set-face-attribute 'org-level-2 nil
    :weight 'bold)

(set-face-attribute 'org-level-3 nil
    :weight 'bold)

(set-face-attribute 'org-level-4 nil
    :weight 'normal)

(set-face-attribute 'org-level-5 nil
    :weight 'normal)

(set-face-attribute 'org-level-6 nil
    :weight 'normal)

(set-face-attribute 'org-level-7 nil
    :weight 'normal)

;; Highlight the entire heading line for Org headings
(setq org-fontify-whole-heading-line t)

;; --- CURSOR SETTINGS ---

;; Set the cursor to a bar shape
(setq-default cursor-type 'bar)

;; Enable blinking cursor
(blink-cursor-mode 1)

;; Smooth scrolling settings to prevent jumping when scrolling
(setq scroll-step 1
  scroll-conservatively 10000)

;; Disable cursor in non-selected windows
(setq-default cursor-in-non-selected-windows nil)

(setq calendar-week-start-day 1)

(global-auto-revert-mode t)