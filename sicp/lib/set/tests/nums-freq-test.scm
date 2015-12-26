(load "lib/set/nums-freq.scm")

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


(test-begin "duplicate-elem?")

(define list-has-duplicate-elem (list 1 2 2 3 3 3))
(define list-has-not-duplicate-elem (list 1 2 3 4 5))

(test-assert "list-has-duplicate-elem test"
			 (duplicate-elem? list-has-duplicate-elem))

(test-assert "list-has-not-duplicate-elem"
			 (not (duplicate-elem? list-has-not-duplicate-elem))

(test-end "duplicate-elem?")
