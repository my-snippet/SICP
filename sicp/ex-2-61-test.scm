(load "ex-2-61.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")
(load "lib/hof/nums-freq.scm")
 

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
						   sample-list)
				0))

(test-end "adjoin-set")
