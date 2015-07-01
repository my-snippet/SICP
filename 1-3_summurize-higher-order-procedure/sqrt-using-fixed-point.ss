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


;; example
(fixed-point cos
             1.0)
(fixed-point (lambda (y) (cos y))
             1.0)
(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)


;; Sqrt using fixed point
;; y^2 = x,
;; y |-> x /y
;; Are there problem? If so, What is it?
(define (sqrt x)
  (fixed-point (lambda (y) (/ x y))
               1.0))


;(sqrt 2)
;(sqrt 3)

;; Fixed?
;; If y^2 = x, THEN
;; [ y < guess-y < x/y ] or [ y > guess-y > x/y ]
(define (average a b)
  (/ (+ a b) 2.0))

(define (sqrt-fixed x)
  (fixed-point (lambda (y) (average (/ x y) y))
               1.0))

(sqrt-fixed 2.0)
(sqrt-fixed 3.0)