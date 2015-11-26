(load "chap-3-5-2.scm")

;;;; internal lib
(load "lib/3/stream/stream.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")
;; prime data
(load "data/prime-table.scm")


(test-begin "test-sieve-of-eratosthenes")

(test-assert "Just test" (= 1 1))

#|
(test-assert "compare first element each other"
			 (= (car prime-table)
				(car primes)))
|#

(test-end "test-sieve-of-eratosthenes")
