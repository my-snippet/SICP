(load "ex-2-29.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "balanced mobile")

(define length-of-b0 3)
(define structure-of-b0 1)
(define b0 (make-branch length-of-b0 structure-of-b0))

(define length-of-b1 6)
(define structure-of-b1 1)
(define b1 (make-branch length-of-b1 structure-of-b1))
(define m01 (make-mobile b0 b1))

(define length-of-b2 4)
(define structure-of-b2 b1)
(define b2 (make-branch length-of-b2 structure-of-b2))
(define m02 (make-mobile b0 b2))

(define b0-copy b0)
(test-assert "eq? test for object comparisons"
			 (eq? b0-copy
				  b0))
			 
(test-assert "mobile selector"
			 (and (eq? (left-branch m01)
					   b0)
				  (eq? (right-branch m01)
					   b1)))		 				  

(test-assert "branch selector"
			 (and (eq? (branch-length b0)
					   length-of-b0)
				  (eq? (branch-structure b0)
					   structure-of-b0)))

(test-assert "total-weight"
			 (= (total-weight m02)
				(+ length-of-b0
				   length-of-b1
				   length-of-b2)))

(test-end "balanced mobile")
