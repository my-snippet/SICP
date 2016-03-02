(load "ex-2-29.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "balanced mobile")


(define b0 (make-branch 3 1))
(define b1 (make-branch 6 1))
(define m01 (make-mobile b0 b1))

(define b0-copy b0)
(test-assert "eq? test for object comparisons"
			 (eq? b0-copy
				  b0))
			 
(test-assert "branch selector in mobile"
			 (and (eq? (left-branch m01)
					   b0)
				  (eq? (right-branch m01)
					   b1)))		 				  

(test-end "balanced mobile")
