(load "ex-1-33.scm")
(load "lib/basic/operations.scm")
(load "chap-1-2-6.scm")
(load "chap-1-2-5.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "filtered-accumulate test")

;; prime? judge 1 as a prime. for escaping this problem, just start with 2
(test-assert "2^2 + 3^2 + 5^2 + 7^2"
			 (= (+ (square 2) (square 3) (square 5) (square 7))
				(filtered-accumulate (lambda (x y) (+ x y))
									 (lambda (n) (prime? n))
									 0 square 2 inc 10)))

(test-assert "product of relatively prime comparing [1..5] to 6"
			 (= (* 1 5)
				(filtered-accumulate (lambda (x y) (* x y))
									 (lambda (k) (= 1 (gcd k 6)))
									 1 identity 1 inc 5)))

(test-end "filtered-accumulate test")
