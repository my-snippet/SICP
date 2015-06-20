#lang racket

(define (factorial n)
  (fact-iter 1 n 1))

(define (fact-iter k n result)
  (cond ((= k n) result)
        ((= n 0) 1)
        ((< n 0) 0)
        (else (fact-iter (+ k 1) 
                         n 
                         (* result (+ k 1))))))

(factorial (- 1))
(factorial 0)
(factorial 1)
(factorial 6)
(factorial 8)
(factorial 10)