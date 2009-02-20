
;; Simple function to search in Apidoc rails API
;; To use it, copy this file to somewhere in your emacs path
;; (i.e., ~/.emacs.d), and add this line to your ~/.emacs
;; 
;;
;; (eval-after-load 'ruby-mode '(require 'rails-apidock))
;;
;;
;; Then put your cursor in the word/symbol you want to look for, and 
;; press C-c d 
;;
;;
(defun gaizka-search-apidock-rails ()
  "Search current word in apidock for rails"
  (interactive)
  (let* ((word-at-point (thing-at-point 'symbol))
		(word (read-string "Search apidock for? " word-at-point)))
	(browse-url (concat "http://apidock.com/rails/" word))))

(define-key ruby-mode-map (kbd "C-c d") 'gaizka-search-apidock-rails)

(provide 'rails-apidock)

