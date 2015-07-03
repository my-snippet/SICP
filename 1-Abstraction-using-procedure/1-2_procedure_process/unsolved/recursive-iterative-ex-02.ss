#lang racket

; recursive iterative exercise

; if n < 3, then f(n) = n
; else f(n) = f(n-1) + 2f(n-2) + 3f(n-3)

(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ (f-recursive (- n 1))
               (* 2 (f-recursive (- n 2)))
               (* 3 (f-recursive (- n 3)))))))

(f-recursive (- 1))
(f-recursive 3)
(f-recursive 4)
(f-recursive 5)
(f-recursive 6)

(define (f-iterative n)
  (f-iterative-inner 3 n 0)
)


; The implementation needed to fix correctly
(define (f-iterative-inner k n result)
  (cond ((< n 3) n)
        ((> k n) result)
        (else (f-iterative-inner (+ k 1)
                                 n
                                 (+ (- k 1) (* 2 (- k 2)) (* 3 (- k 3)))))))
                 
(f-iterative (- 1))
(f-iterative 3)
(f-iterative 4)
(f-iterative 5)