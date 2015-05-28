#lang racket

; Plus operation using recursive, iterative

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

(define (plus-using-recursive a b)
  (if (= a 0)
      b
      (inc (plus-using-recursive (dec a) b))))

(define (plus-using-iterative a b)
  (if (= a 0)
      b
      (plus-using-iterative (dec a) (inc b))))


(plus-using-recursive 0 3)
(plus-using-recursive 5 3)

(plus-using-iterative 0 3)
(plus-using-iterative 5 3)