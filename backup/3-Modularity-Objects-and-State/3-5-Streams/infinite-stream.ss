(load "../../modules/3/stream.ss")

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))
(stream-ref integers 7)


(define (divisible? x y)
  (= (remainder x y) 0))


(define no-sevens
  (stream-filter (lambda (x) (not (= (remainder x 7) 0)))
		 integers))
(stream-ref no-sevens 100)


(define (fibgen a b)
  (cons-stream a (fibgen b (+ a b))))

(define fibs (fibgen 0 1))
(stream-ref fibs 6)
					; 0 1 1 2 3 5 8


(define (sieve stream)
  (cons-stream
   (stream-car stream)
   (sieve (stream-filter
	   (lambda (x)
	     (not (divisible? x (stream-car stream))))
	   (stream-cdr stream)))))

(define primes (sieve (integers-starting-from 2)))
(stream-ref primes 50)
