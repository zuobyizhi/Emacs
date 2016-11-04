;;; tdxscript-mode.el --- sample major mode for editing LSL.

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
(setq tdxscript-keywords '("IF" "AND" "OR") )
(setq tdxscript-types '("DOTLINE" "LINESTICK" "NODRAW" "VOLSTICK" "STICK"))
(setq tdxscript-constants '("C" "O" "L" "H" "CLOSE" "OPEN" "LOW" "HIGH" "V" "VOL"))
(setq tdxscript-events '("ISLASTBAR"))
(setq tdxscript-functions '("MA" "XMA" "SMA" "DMA" "MA" "PLOYLINE" "MAX" "MIN" "SQRT" "SUM" "STICKLINE" "STD" "ABS" "REF" "CROSS" "BARSLAST" "HHV" "LLV" "FINANCE"))

;; generate regex string for each category of keywords
(setq tdxscript-keywords-regexp (regexp-opt tdxscript-keywords 'words))
(setq tdxscript-type-regexp (regexp-opt tdxscript-types 'words))
(setq tdxscript-constant-regexp (regexp-opt tdxscript-constants 'words))
(setq tdxscript-event-regexp (regexp-opt tdxscript-events 'words))
(setq tdxscript-functions-regexp (regexp-opt tdxscript-functions 'words))

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq tdxscript-font-lock-keywords
      `(
        (,tdxscript-type-regexp . font-lock-type-face)
        (,tdxscript-constant-regexp . font-lock-constant-face)
        (,tdxscript-event-regexp . font-lock-builtin-face)
        (,tdxscript-functions-regexp . font-lock-function-name-face)
        (,tdxscript-keywords-regexp . font-lock-keyword-face)
        ;; note: order above matters, because once colored, that part won't change.
        ;; in general, longer words first
        ))

;;;###autoload
(define-derived-mode tdxscript-mode java-mode "tdxscript mode"
  "Major mode for editing tdxscript…"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((tdxscript-font-lock-keywords))))

;; clear memory. no longer needed
(setq tdxscript-keywords nil)
(setq tdxscript-types nil)
(setq tdxscript-constants nil)
(setq tdxscript-events nil)
(setq tdxscript-functions nil)

;; clear memory. no longer needed
(setq tdxscript-keywords-regexp nil)
(setq tdxscript-types-regexp nil)
(setq tdxscript-constants-regexp nil)
(setq tdxscript-events-regexp nil)
(setq tdxscript-functions-regexp nil)

;; add the mode to the `features' list
(provide 'tdxscript-mode)

;; Local Variables:
;; coding: utf-8
;; End:

;;; tdxscript-mode.el ends here
