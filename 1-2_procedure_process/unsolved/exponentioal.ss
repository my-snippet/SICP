#lang racket
;; Book uses (= n 0), but this code uses (> n 0) 
;; for exception of - exponential

(define (exp a n)
  (if (> n 0)
      (* a (exp a (- n 1)))
      1))

(exp 2 4)
(exp 3 4)
(exp 3 0)
(exp 3 1)
; (exp 3 (- 1)) ; power of - not supported

(define (exp-iter a n)
  (exp-iter-inner a n 1))

(define (exp-iter-inner a n product)
  (if (> n 0)
      (exp-iter-inner a (- n 1) (* a product))
      product))

(exp-iter 2 4)
(exp-iter 3 4)
(exp-iter 3 0)
(exp-iter 3 1)