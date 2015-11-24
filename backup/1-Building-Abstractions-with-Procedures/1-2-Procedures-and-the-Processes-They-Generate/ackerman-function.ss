#lang racket

; Ackermann function
(define (A x y)
  (cond ((= x 0) (* 2 y))
        ((and (>= x 1) (= y 0)) 0)
        ((and (>= x 1) (= y 1)) 0)
        (else (A (- x 1)
                 (A x (- y 1))))))


; test : (if (not (= x 0)) ...) 
(A 1 10)
(A 2 4)
(A 3 3)
(A 10 1)
(A 100 100)
 
; Boundary condition
(A 0 1)
(A 0 20)