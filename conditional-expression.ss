#lang racket

; abs x with case analysis
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(abs 4)
(abs 0)
(abs -4)

; abs x with case analysis and special symbol: else
(define (abs_ x)
  (cond ((< x 0) (- x))
    (else x)))

(abs_ 4)
(abs_ 0)
(abs_ -4)

; abs x with special symbol: if
; (if <predicate> <consequent> <alternative>)
(define (abs__ x)
  (if (< x 0) 
      (- x)
      x))

(abs__ 4)
(abs__ 0)
(abs__ -4)
