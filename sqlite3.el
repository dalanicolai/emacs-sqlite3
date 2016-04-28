;;; sqlite3.el --- sqlite3 binding of Emacs Lisp

;; Copyright (C) 2016 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>
;; URL: https://github.com/syohex/emacs-sqlite3
;; Version: 0.01

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'sqlite3-core)

(defun sqlite3-new (&optional dbpath)
  (sqlite3-core-new dbpath))

(defun sqlite3-execute-batch (sqlite query &optional bounds)
  (if (null bounds)
      (sqlite3-core-execute-batch sqlite query)
    (unless (vectorp bounds)
      (setq bounds (apply #'vector bounds)))
    (sqlite3-core-execute-batch sqlite query bounds)))

(defun sqlite3-execute (sqlite query &optional cb)
  (sqlite3-core-execute sqlite query cb))

(provide 'sqlite3)

;;; sqlite3.el ends here
