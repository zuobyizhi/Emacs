;;; mq-mode.el --- sample major mode for editing LSL.

;; Copyright © 2015, by you

;; Author: your name ( your email )
;; Version: 2.0.13
;; Created: 26 Jun 2015
;; Keywords: languages
;; Homepage: http://ergoemacs.org/emacs/elisp_syntax_coloring.html

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 2.

;;; Commentary:

;; short description here

;; full doc on how to use here


;;; Code:

;; define several category of keywords
(setq mq-keywords '("If" "Else" "ElseIf" "Then" "While" "Wend" "For" "Next" "Select" "Case" "Do" "Loop" "Until" "Sub" "Function" "Call" "End" "Sub" "Dim" "Exit" "EndScript" "And" "Or" "Mod" "Not") )
(setq mq-types '("Null" "Boolean" "Integer" "Float" "String" "Array"))
(setq mq-constants '("True" "False"))
(setq mq-events '("Date" "Time"))
(setq mq-functions '("Delay" "RunApp" "KeyPress" "KillApp" "GetScreenX" "GetScreenY" "KeyDown" "KeyUp" "ShowMessage" "Touch" "Tap" "Swipe" "Fix" "GetDeviceID" "FindColor" "InputText" "TouchDown" "TouchMove" "TouchUp" "TracePrint"))

;; generate regex string for each category of keywords
(setq mq-keywords-regexp (regexp-opt mq-keywords 'words))
(setq mq-type-regexp (regexp-opt mq-types 'words))
(setq mq-constant-regexp (regexp-opt mq-constants 'words))
(setq mq-event-regexp (regexp-opt mq-events 'words))
(setq mq-functions-regexp (regexp-opt mq-functions 'words))

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq mq-font-lock-keywords
      `(
        (,mq-type-regexp . font-lock-type-face)
        (,mq-constant-regexp . font-lock-constant-face)
        (,mq-event-regexp . font-lock-builtin-face)
        (,mq-functions-regexp . font-lock-function-name-face)
        (,mq-keywords-regexp . font-lock-keyword-face)
        ;; note: order above matters, because once colored, that part won't change.
        ;; in general, longer words first
        ))

;;;###autoload
(define-derived-mode mq-mode java-mode "mq mode"
  "Major mode for editing mq…"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((mq-font-lock-keywords))))

;; clear memory. no longer needed
(setq mq-keywords nil)
(setq mq-types nil)
(setq mq-constants nil)
(setq mq-events nil)
(setq mq-functions nil)

;; clear memory. no longer needed
(setq mq-keywords-regexp nil)
(setq mq-types-regexp nil)
(setq mq-constants-regexp nil)
(setq mq-events-regexp nil)
(setq mq-functions-regexp nil)

;; add the mode to the `features' list
(provide 'mq-mode)

;; Local Variables:
;; coding: utf-8
;; End:

;;; mq-mode.el ends here
