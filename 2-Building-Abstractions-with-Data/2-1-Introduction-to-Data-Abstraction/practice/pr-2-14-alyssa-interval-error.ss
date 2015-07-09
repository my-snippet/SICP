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

(define (div-interval x y)
  (mul-interval x
                 (make-interval (/ 1.0 (upper-bound y))
                                (/ 1.0 (lower-bound y)))))
;;
;;
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (make-center-percent c allowable-error)
  (make-interval (- c (* c allowable-error))
                 (+ c (* c allowable-error))))
;;
;;
(define (par r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
  (div-interval one 
                (add-interval (div-interval one r1)
                              (div-interval one r2)))))
;;
;;
(define r1 (make-center-percent 100 0.01))
(define r2 (make-center-percent 1000 0.04))
;;
;;
(newline)
(par r1 r2)
(par2 r1 r2)
(newline)
(par r1 r1)
(par2 r1 r1)
(newline)
(par r2 r2)
(par2 r2 r2)
;;
;;
