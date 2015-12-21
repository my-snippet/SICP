(load "chap-2-3-3.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "set")
(define must-contain-this 1)
(define must-not-contain-this (- 1))

(define sample-list (list must-contain-this 2 3 4 5))
(test-assert "assert contain"
			 (element-of-set? must-contain-this
							  sample-list))

(test-assert "assert not contain"
			 (not (element-of-set? must-not-contain-this
								   sample-list)))

(test-end "set")

