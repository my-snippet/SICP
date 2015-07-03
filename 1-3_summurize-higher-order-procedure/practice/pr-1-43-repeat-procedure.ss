#lang racket

;; 'f' is a procedure iterator, f iterate procedure n times
;; for example, x |-> x+1, then the result of f is, x |-> x + n

(define (inc n)
  (+ n 1))

(define (square n)
  (* n n))

(define (repeated f x)
  (define (repeated-inner n)
    (if (> n 0)
        (f (repeated-inner (- n 1)))
        x))
  (lambda (n) (repeated-inner n)))

((repeated inc 1) 4)
((repeated inc 1) 8)
((repeated square 2) 4)
;; I calculated it (((2^2)^2)...^2)
;; It's different with Book