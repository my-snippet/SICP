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
(add-interval r1 r2)
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

(mul-interval r1 r2)
;;
;;

;; Recheck div-interval value, it shows double pair
(define (div-interval x y)
  (mul-interval x
                 (make-interval (/ 1.0 (upper-bound y))
                                (/ 1.0 (lower-bound y)))))

(newline)
(div-interval r1 r2)
;; 