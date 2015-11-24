#lang racket

;; Find x if negative value, positive value not provided

(define (close-enough? neg-point pos-point)
  (< (abs (+ neg-point pos-point)) 0.001))

(define (get-mid-point a b)
  (/ (+ a b) 2.0))

(define (search f neg-point pos-point)
  (let ((mid-point (get-mid-point neg-point pos-point)))
    (if (close-enough? (f neg-point) (f pos-point))
        mid-point
        (let ((f-value (f mid-point)))
          (cond ((positive? f-value)
                 (search f neg-point mid-point))
                ((negative? f-value)
                 (search f mid-point pos-point))
                (else mid-point))))))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))
          

(half-interval-method sin 2.0 4.0)
(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
                      1.0 
                      2.0)