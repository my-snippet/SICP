(load "ex-1-13.scm")
(load "lib/basic/operations.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "fib n test")

(test-assert "prove fib n value is approximately golden ratio when n is increasing"
			 ;; if n is over 35, almost double times increased,
			 ;; it is because data is may too small.
			 (gradually-decreasing fib (lambda (n) (/ (power phi n) (sqrt 5))) 35))

(test-end "fib n test")

;;(gradually-decreasing fib (lambda (n) (/ (power phi n) (sqrt 5))) 40)
