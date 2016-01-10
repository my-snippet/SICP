(load "ex-2-18.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "reverse-not-built-in")

(define l1 (list 1 2 3 4))
(define empty-list '())

(test-assert "?"
			 (= 1 1))

(test-assert "double reversed list should be equal to the original list"
			 (map (lambda (x1 x2) (eq? x1 x2))
				  (reverse-not-built-in (reverse-not-built-in l1))
				  l1))

(test-assert "reverse empty list"
			 (eq? (reverse-not-built-in empty-list) empty-list))

(test-end "reverse-not-built-in")
