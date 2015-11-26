(load "chap-3-5-2.scm")

;;;; internal lib
(load "lib/3/stream/stream.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")
;; prime data
(load "data/prime-table.scm")


(test-begin "test-sieve-of-eratosthenes")

(test-assert "Just test" (= 1 1))

(test-assert "Compare first element each other"
			 (= (car prime-table)
				(car primes)))

(test-assert "Compare the elements of primes & prime-table before 1,000"
			 (compare-stream-and-list
			  primes
			  prime-table))

(test-end "test-sieve-of-eratosthenes")
