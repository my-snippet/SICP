(load "ex-2-29.scm")


(define length-0 3)
(define structure-0 2)
(define b0 (make-branch length-0 structure-0))

(define length-1 2)
(define structure-1 3)
(define b1 (make-branch length-1 structure-1))
(define m01 (make-mobile b0 b1))
(define m10 (make-mobile b1 b0))

(define m00 (make-mobile b0 b0))
(define b00 (make-branch length-0 m00))
(define m0000 (make-mobile b00 b00))

(define length-2 4)
(define structure-2 m01)
(define b2 (make-branch length-2 structure-2))
(define m02 (make-mobile b0 b2))
(define m20 (make-mobile b2 b0))

(define b0-copy b0)

(define length-3 5)
(define structure-3 m02)
(define b3 (make-branch length-3 structure-3))
(define m03 (make-mobile b0 b3))
