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
(define (resister r allowable-error)
  (cons (- r (* r allowable-error))
        (+ r (* r allowable-error))))

(define r1 (resister 480 0.1))
(define r2 (resister 330 0.05))
r1
r2
;;
;;
;; Description
;; lower value - upper value : lower-bound
;; upper value - lower value : upper-bound
(define (sub-interval x y)
  ((lambda (p1 p2 p3 p4)
  (make-interval (min p1 p2 p3 p4)
                 (max p1 p2 p3 p4)))
   (- (lower-bound x)
      (upper-bound y))
   (- (lower-bound y)
      (upper-bound x))
   (- (upper-bound x)
      (lower-bound y))
   (- (upper-bound y)
      (lower-bound x))))
(sub-interval r1 r2)