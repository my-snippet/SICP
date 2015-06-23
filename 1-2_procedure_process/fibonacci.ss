#lang racket

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))

(fib 0)
(fib 1)
(fib 2)
(fib 4)
(fib 5)
(fib 9)

(define (fib-iter n)
  (fib-iter-inner n 1 0))

(define (fib-iter-inner n a b)
  (if (> n 1)
      (fib-iter-inner (- n 1) (+ a b) a)
      (if (= n 0)
          0
          a)))

(fib-iter 0)
(fib-iter 1)
(fib-iter 2)
(fib-iter 4)
(fib-iter 5)
(fib-iter 9)