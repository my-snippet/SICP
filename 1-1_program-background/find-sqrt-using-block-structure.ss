#lang racket

(define (square x)
    (* x x))

(define (average a b)
    (/ (+ a b) 2))
  
(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  
  ; Following line may set guess 0.1
  (sqrt-iter 1.0))

(sqrt 4)
(sqrt 9)
(sqrt 16)