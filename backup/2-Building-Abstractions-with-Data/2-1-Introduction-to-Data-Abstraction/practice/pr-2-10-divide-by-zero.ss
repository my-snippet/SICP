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

(define ra (resister 10 1.0))
(define rb (resister 40 1.0))
ra
rb
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
;;
;;

;; Recheck div-interval value, it shows double pair
(define (div-interval x y)
  (if (or (= (upper-bound y) 0) 
          (= (lower-bound y) 0))
      (error "divide by zero")
      (make-interval 
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(div-interval ra rb)