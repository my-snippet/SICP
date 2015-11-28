(load "chap-2-2-2.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "test foldl")
(define sample-list (list 1 2 3 4 5))
(test-assert "sum test" (= (+ 1 2 3 4 5)
						   (foldl (lambda (a b) (+ a b)) 0 sample-list)))
(test-end "test foldl")

(test-begin "test foldr")
(define sample-list (list 1 2 3 4 5))
(test-assert "sum test" (= (+ 1 2 3 4 5)
						   (foldr (lambda (a b) (+ a b)) 0 sample-list)))
(test-end "test foldr")
