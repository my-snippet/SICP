#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  
  (try first-guess))


;; Golden ratio satisfy following equation
;; g(a+b)/a = b/a = phi
;; phi^2 - phi -1 = 0
;; phi = (1+√5)/2

;; Also, this satisfy a:b=1.618:1
;; from this ratio, set b = 1
;; then (a+b)/a = (a+1)/a = 1+(1/a) = phi
;; Therefore "phi |-> 1+(1/x)"

(fixed-point (lambda (x) (+ 1 (/ 1.0 x)))
             1.0)