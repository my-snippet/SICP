;; Q : Differences and Familarities between
;; sum-odd-squares and even-fibs
;; enumerate what?
;; compute what?
;; filter what?
;; accumulate what?
;; -> And think about signal-flow


(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
		((not (pair? tree))
		 (if (odd? tree) (square tree) 0))
		(else (+ (sum-odd-squares
				  (car tree))
				 (sum-odd-squares
				  (cdr tree))))))

;; It constructs a list of all the even Fibonacci numbers Fib(k)
;; where kk is less than or equal to a given integer n
(define (even-fibs n)
  (define (next k)
	(if (> k n)
		nil
		(let ((f (fib k)))
		  (if (even? f)
			  (cons f (next (+ k 1)))
			  (next (+ k 1))))))
  (next 0))
