#lang racket

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))

(fib 4)
(fib 5)
(fib 9)

;(define (fib-iter n)
;  (fib-iter-inner n 0))

;(define (fib-iter-inner n product)
