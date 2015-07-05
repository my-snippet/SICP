#lang racket

(define tolerance 0.00001)

(define (display-guess guess)
  (display "guess = ")
  (display guess)
  (newline))

(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (display-guess guess)
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))


;; I don't understand what the problem demand
;; Just guess
;; first guess value is preceeding
;;(fixed-point (lambda (x) (/ (log 1000) (log x)))
;; 