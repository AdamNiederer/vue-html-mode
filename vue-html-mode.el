;;; vue-html-mode.el --- Major mode for editing Vue.js templates

;; Copyright 2016 Adam Niederer

;; Author: Adam Niederer <adam.niederer@gmail.com>
;; URL: http://github.com/AdamNiederer/vue-mode
;; Version: 0.1
;; Keywords: vue template
;; Package-Requires: ()

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary

;; The main features of this mode are syntax highlighting (enabled with
;; `font-lock-mode' or `global-font-lock-mode'), and html-mode
;; integration
;;
;; Exported names start with "vue-html-"; private names start with
;; "vue-html--".

;;; Code:

(defconst vue-html-interp-regex
  "{{.*?\\(|\\) *\\(.*?\\) *}}")

(defconst vue-html-shorthand-regex
  "<\\w+.* +\\([@:]\\)\\([A-z.]+\\)=.*?>")

(defconst vue-html-directive-regex
  "\\b\\(v-\\w+\\)\\(:[A-z.]\\)?=")

(defcustom vue-html-tab-width 2
  "Tab width for vue-html-mode"
  :group 'vue
  :type 'integer)

(defvar vue-html-font-lock-keywords
  `((,vue-html-interp-regex . (0 font-lock-variable-name-face t))
    (,vue-html-interp-regex . (1 font-lock-keyword-face t))
    (,vue-html-interp-regex . (2 font-lock-function-name-face t))
    (,vue-html-directive-regex . (1 font-lock-builtin-face t))
    (,vue-html-shorthand-regex . (1 font-lock-builtin-face t))
    (,vue-html-shorthand-regex . (2 font-lock-variable-name-face t))))

(defvar vue-html-mode-map
  (let ((map (make-keymap)))
    map)
  "Keymap for vue-html-mode")

;;;###autoload
(define-derived-mode vue-html-mode
  html-mode "vue-html"
  "Major mode for Vue.js templates"
  (setq tab-width vue-html-tab-width)
  (font-lock-add-keywords nil vue-html-font-lock-keywords))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.vue.html\\'" . vue-html-mode))

(provide 'vue-html)
;;; vue-html.el ends here
