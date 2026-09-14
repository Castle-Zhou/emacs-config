;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

(setq confirm-kill-emacs #'yes-or-no-p) ; When close the emacs, ask yes or no

(tool-bar-mode -1) ; Switch off the tool bar

(global-auto-revert-mode t) ; Switch on the auto-refresh when other
                            ; editor changes the file

(column-number-mode t) ; Switch on the column-number display in the mode line

(scroll-bar-mode -1) ; Switch off the scroll bar (also effective in daemon / -nw)

(setq make-backup-files nil) ; Switch off the auto-backup files

(setq inhibit-startup-screen t) ; Switch off the startup window

(add-hook 'prog-mode-hook #'hs-minor-mode) ; Switch on folding code block

;; Share the kill ring with the OS.  The NS build of Emacs already talks to
;; the macOS pasteboard natively, so no pbpaste/pbcopy hack is needed: that
;; version also pushed external text into the kill ring on every yank.
(setq select-enable-clipboard t) ; Use the OS clipboard (default: t)
(setq select-enable-primary nil) ; Do not shadow it with the primary selection

;; Keep M-x customize out of this file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-missing)

;;; init.el ends here
