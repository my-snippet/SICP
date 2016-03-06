(load "ex-2-17.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "last pair")

(define flat-last 4)
(define multiple-last (list 4 5))

(define flat-list (list 1 2 3 flat-last))
(define multiple-list (list 1 2 3 multiple-last))

(test-assert "case 1 : flat-list"
			 (= flat-last (car (last-pair flat-list))))

(test-assert "case 2 : multiple-list"
			 (and (= (car multiple-last) (caar (last-pair multiple-list)))
				  (= (cadr multiple-last) (cadar (last-pair multiple-list)))))

(test-end "last pair")
