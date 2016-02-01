(load "ex-1-37.scm")
(load "lib/basic/operations.scm")
 

;; idea 1 :
;; give x/1 as initial value

;; idea 2 :
;; modify 1 as (1/x) * x

;; Here it chose the idea 2

(define (tan-cf x k)
  (* (- (/ 1.0 x)) (cont-frac (lambda (i) (- (square x)))
							  (lambda (i) (- (* 2 i) 1))
							  k)))
