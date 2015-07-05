#lang racket

(define (inc n)
  (+ n 1))

(define (cube n)
  (* n n n))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(sum cube 0 inc 2)
(sum cube 0 inc 3)
(sum cube 0 inc 4)