(load "ex-1-38.scm")
(load "lib/basic/operations.scm")


(find-n-when-satisfy-tolerance
 (lambda (k) (e-calculation k))
 e 0.0001 1 inc)
