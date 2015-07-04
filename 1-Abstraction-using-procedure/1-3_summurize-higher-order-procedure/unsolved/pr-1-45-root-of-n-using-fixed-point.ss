#lang racket

(define tolerance 0.00001)

(define (even? n)
  (= (/ n 2) 0))

(define (square n)
  (* n n))

(define (fast-exp a n)
  (if (> n 0)
      (if (even? n)
          (square (fast-exp a (/ n 2)))
          (* a (fast-exp a (- n 1))))
      1))

(define (average a b)
  (/ (+ a b) 2.0))

(define (average-damp f)
  (lambda (x) 
    (average x (f x))))

(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    (display (abs (- v1 v2)))
    (newline)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))

(define (sqrt-fixed x)
  (fixed-point (lambda (y) (average (/ x y) y))
               1.0))

(define (root-of-n x n)
  (fixed-point (average-damp
                (lambda (y)
                  (/ x (fast-exp y (- n 1)))))
               1.0))

(root-of-n 8 3)
;; No problem to solve cube root
;; But it causes problem more than 4th root

