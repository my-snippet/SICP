(load "ex-2-13.scm")


(define i1 (make-interval 50.0 50.1))
(define i2 (make-interval 100.0 100.1))
(mul-interval-approx i1 i2)
(mul-interval i1 i2)

(define i3 (make-interval 10.0 100.0))
(define i4 (make-interval 100.0 200.0))
(mul-interval-approx i3 i4)
(mul-interval i3 i4)
