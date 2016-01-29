(load "ex-2-47.scm")

(define origin (make-vect 0 0))
(define edge1 (make-vect 2 4))
(define edge2 (make-vect 3 9))

(define a (make-frame origin edge1 edge2))
(define b (make-frame-cons origin edge1 edge2))

a
b
(origin-frame a)
(origin-frame b)
(edge1-frame a)
(edge1-frame b)
(edge2-frame a)
(edge2-frame-in-cons b)
