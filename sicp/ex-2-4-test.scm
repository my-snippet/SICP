(load "ex-2-4.scm")


(define p1 (cons_ 2 1))
(car_ p1)
(cdr_ p1)

(define p2 (cons_ 3 p1))
(car_ p2)
(cdr_ p2)
(cddr_ p2)
(cdar_ p2)
