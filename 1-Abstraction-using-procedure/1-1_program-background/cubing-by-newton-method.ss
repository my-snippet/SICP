#lang racket

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
                 x)))

(define (square x)
  (* x x))

(define (cubing x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cubing guess) x)) 0.001))

(define (improve guess x)
 (/ 
  (+ 
   (/ x (square guess)) 
   (* guess 2)) 
  3))


(define (average a b)
  (/ (+ a b) 2))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 2)
(cube-root 4)
(cube-root 8)

(cube-root 64)
(cube-root 125)