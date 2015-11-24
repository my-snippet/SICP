(load "../../modules/3/stream.ss")


(define s1 (stream-enumerate-interval 1 10))
(define s2 (stream-enumerate-interval 11 20))


(define ones (cons-stream 1 ones))


(define (add-streams s1 s2)
  (stream-map + s1 s2))
;; (add-streams s1 s2)


(define integers (cons-stream 1 (add-streams ones integers)))


(define fibs
  (cons-stream 0
	       (cons-stream 1
			    (add-streams (stream-cdr fibs)
					 fibs))))

;; (stream-ref fibs 6)
;; 0 1 1 2 3 5 8


(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define double (cons-stream 1 (scale-stream double 2)))
;; (stream-ref double 10)


;; Some complex
(define (prime? n)
  (define (iter ps)
    (cond ((> (square (stream-car ps)) n) true)
	  ((divisible? n (stream-car ps)) false)
	  (else (iter (stream-cdr ps)))))
  (iter primes))

(define primes
  (cons-stream
   2
   (stream-filter prime? (integer-starting-from 3))))
;(stream-ref primes 10)
