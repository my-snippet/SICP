#lang racket

;; estimate x of equation
;; 1. Without lambda, let
;; 2. Using lambda, let

(define (square n)
  (* n n))

;; y = 1/2x^2 -2
(define (f1 x)
  (- (/ (square x) 2.0) 2))

(define (close-enough? neg-point pos-point)
  (< (abs (+ neg-point pos-point)) 0.1))

(define (get-mid-point a b)
  (/ (+ a b) 2.0))

(define (find-x f neg-point pos-point)
  (if (close-enough? (f neg-point) (f pos-point))
      (get-mid-point neg-point pos-point)
      
      (if (> (f (get-mid-point neg-point pos-point))
             0)
          (find-x f
                  neg-point
                  (get-mid-point neg-point pos-point))
          (find-x f
                  (get-mid-point neg-point pos-point) 
                  pos-point))))

(find-x f1 1 9)
(find-x f1 (- 10) 10)
(find-x f1 (- 10) 13)


