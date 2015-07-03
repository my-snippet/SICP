#lang racket

(define (inc x)
  (+ x 1))

(define (double f)
  (lambda (x) (f (f x))))

((double inc) 1)

((double inc) 5)
((double (double inc)) 5)
((double (double (double inc))) 5) 
;;  --> d(d(d(inc))) = inc^2*3

(((double (double double)) inc) 5) 
;; --> d(d(d(d))(inc) = inc^2^4