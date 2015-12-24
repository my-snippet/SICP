(load "lib/hof/nums-freq.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "numbers frequency")

(define sample-list (list 1 2 2 3 3 3))

(test-assert "1 is contained in the list a time"
			 (= (nums-freq 1 sample-list)
				1))

(test-assert "2 is contained in the list 2 times"
			 (= (nums-freq 2 sample-list)
				2))

(test-assert "3 is contained in the list 3 times"
			 (= (nums-freq 3 sample-list)
				3))

(test-assert "4 isn't contained in the list "
			 (= (nums-freq 4 sample-list)
				0))

(test-end "numbers frequency")
