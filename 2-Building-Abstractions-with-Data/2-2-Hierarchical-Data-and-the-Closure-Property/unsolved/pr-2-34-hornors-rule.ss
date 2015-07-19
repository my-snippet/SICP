#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (hornal-evel x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (* (+ this-coeff
                      higher-terms) x))
              0
              coefficient-sequence))

(hornal-evel 2
             (list 1 3 0 5 0 1))
;; 1 + 3x + 5x^3 + x^5
;; if x = 2, then 1 + 3*2 + 5*8 + 32 = 79