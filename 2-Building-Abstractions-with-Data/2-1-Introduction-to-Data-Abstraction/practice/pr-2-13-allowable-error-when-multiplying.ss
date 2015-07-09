#lang racket

(define (make-interval a b)
  (cons a b))

(define (lower-bound r)
  (car r))

(define (upper-bound r)
  (cdr r))

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))
;;
;;
(define (mul-interval x y)
  ((lambda (p1 p2 p3 p4)
     (make-interval (min p1 p2 p3 p4)
                    (max p1 p2 p3 p4)))
   (* (lower-bound x)
          (lower-bound y))
   (* (lower-bound x)
          (upper-bound y))
   (* (upper-bound x)
          (lower-bound y))
   (* (upper-bound x)
          (upper-bound y))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (make-center-percent c allowable-error)
  (make-interval (- c (* c allowable-error))
                 (+ c (* c allowable-error))))

(define (percent c)
  (/ (/ (- (cdr c) (car c)) 2.0) 
     (center c)))
;;
;;
(define r1 (make-center-percent 100 0.1))
(define r2 (make-center-percent 1000 0.05))
(define r3 (make-center-percent 330 0.025))
r1
r2
(mul-interval r1 r2)
(percent (mul-interval r1 r2))
(+ (percent r1) (percent r2))
(percent (mul-interval r1 r3))
(+ (percent r1) (percent r3))
;;
;;
;; I think muliplying interval allowable error can be gueesed with
;; the sum of allowable error of two resiter