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
;; lower value r1 - upper value r2 > lower value r1 - lower value r2
;; upper value r1 - lower value r2 > upper value r1 - upper value r2
(define (sub-interval x y)
  (make-interval (- (lower-bound x)
                    (upper-bound y))
                 (- (upper-bound x)
                    (lower-bound y))))

(sub-interval r1 r2)