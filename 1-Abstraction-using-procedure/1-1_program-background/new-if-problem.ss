#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 2) 1 0)
(new-if (= 2 3) 1 0)

#|
; What will be happened if you run following code?

(define (factorial x)
  (new-if (<= x 1)
      1
      (* x (factorial (- x 1)))))

(factorial 5)

|#