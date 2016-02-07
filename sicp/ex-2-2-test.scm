(load "ex-2-2.scm")


(define a (make-point 1 2))
(print-point a)

(define b (make-point (- 1) (- 2)))
(print-point b)

(define s (make-segment a b))
(print-segment s)

(define m (midpoint-segment s))
(print-point m)
