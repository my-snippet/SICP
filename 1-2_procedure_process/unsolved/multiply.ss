#lang racket

(define (x a b)
  (if (> b 0)
      (+ a (x a (- b 1)))
      0))

(x 2 0)
(x 2 1)
(x 2 4)
(x 5 4)

(define (even? n)
  (= (/ n 2) 0))

(define (halve n)
  (/ n 2))

(define (double n)
  (+ n n))

(define (x-iter a b)
  (if (> b 0)
      (if (even? b)
          (double (+ a (x a (halve b))))
          (+ a (x a (- b 1))))
      0))

(x-iter 2 0)
(x-iter 2 1)
(x-iter 2 4)
(x-iter 5 4)