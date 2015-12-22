(load "chap-2-3-3.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")
(load "lib/hof/nums-freq.scm")
 

(test-begin "element-of-set?")

(define must-contain-this 1)
(define must-not-contain-this (- 1))

(define sample-list (list must-contain-this 2 3 4 5))
(test-assert "assert contain"
			 (element-of-set? must-contain-this
							  sample-list))

(test-assert "assert not contain"
			 (not (element-of-set? must-not-contain-this
								   sample-list)))



(test-end "element-of-set?")

(test-begin "adjoin-set")

(define already-contained-elem 1)
(define new-elem 6)
(define not-contained-elem (- 1))

(define sample-list (list already-contained-elem 2 3 4 5))

(test-assert "?"
			 (= 1 1))

(test-assert "adjoin new element"
			 (= (nums-freq new-elem
						   (adjoin-set new-elem
									   sample-list))
				1))

(test-assert "duplicate test"
			 (= (nums-freq already-contained-elem
						   (adjoin-set already-contained-elem
									   sample-list))
				1))

(test-assert "not-contained test"
			 (= (nums-freq not-contained-elem
						   (adjoin-set not-contained-elem
									   sample-list))
				1))

(test-end "adjoin-set")
