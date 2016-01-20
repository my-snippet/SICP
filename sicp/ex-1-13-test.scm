(load "ex-1-13.scm")
(load "lib/basic/operations.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "fib n test")

(define phi (/ (+ 1 (sqrt 5)) 2))

(define (gradually-decreasing f1 f2 n)
  (define (gd-iter k previous-result)
	(if (> k n)
		true
		(let ((now-result (abs (- (f1 k) (f2 k)))))
		  (let ((decreased? (> previous-result now-result)))
			(display now-result)
			(newline)
			(if decreased?							   
				(gd-iter (+ k 1) now-result)
				(error
				 "It has been decreased from 0 to" (- k 1) ", not decreased from" k
				 ))))))
  (gd-iter 0 1))

(test-assert "prove fib n value is approximately golden ratio when n is increasing"
			 ;; if n is over 35, almost double times increased,
			 ;; it is because data is may too small.
			 (gradually-decreasing fib (lambda (n) (/ (power phi n) (sqrt 5))) 35))

(test-end "fib n test")

;;(gradually-decreasing fib (lambda (n) (/ (power phi n) (sqrt 5))) 40)
