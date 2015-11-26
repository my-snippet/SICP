;;;; internal lib
(load "lib/3/stream/stream.scm")


(define (sieve stream)
  (cons-stream
   (stream-car stream)
   (sieve (stream-filter
		   (lambda (x)
			 (not (divisible?
				   x (stream-car stream))))
		   (stream-cdr stream)))))

(define primes
  (sieve (integers-starting-from 2)))
