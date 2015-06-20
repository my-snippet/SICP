#lang racket

; recursive iterative exercise

; if n < 3, then f(n) = n
; else f(n) = f(n-1) + 2f(n-2) + 3f(n-3)

(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ (f-recursive (- n 1))
               (* (f-recursive (- n 2)) 2)
               (* (f-recursive (- n 3)) 3)))))

; (define (f-iterative n)
  