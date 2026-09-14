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

;;; Package management -------------------------------------------------------
;; Emacs 30 already ships "gnu" and "nongnu" in `package-archives', so
;; MELPA only needs to be appended.  Packages are activated before init.el
;; is read (startup.el calls `package-activate-all' first), which is why no
;; `package-initialize' call is needed here.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; When a package exists in several archives prefer the release-quality
;; ones, so MELPA snapshots cannot shadow the built-in/ELPA copies.
(setq package-archive-priorities '(("gnu" . 10)
                                   ("nongnu" . 5)
                                   ("melpa" . 0)))

;; use-package is built in since Emacs 29; nothing to install for it.
(require 'use-package)

;; Keep M-x customize out of this file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-missing)

;;; init.el ends here
