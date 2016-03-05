(load "ex-2-29-d.scm")


(define length-0 3)
(define structure-0 2)
(define b0 (make-branch length-0 structure-0))

(define length-1 2)
(define structure-1 3)
(define b1 (make-branch length-1 structure-1))

(define m01 (make-mobile b0 b1))

(define length-2 4)
(define structure-2 m01)

(define b2 (make-branch length-2 structure-2))
(define m02 (make-mobile b0 b2))
