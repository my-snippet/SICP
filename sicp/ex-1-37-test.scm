(load "ex-1-37.scm")
(load "lib/basic/operations.scm")


(find-n-when-satisfy-tolerance
 (lambda (k) (cont-frac-recur (lambda (i) 1.0)
							  (lambda (i) 1.0)
							  k))
 (/ 1 1.6180327868852458) 0.0001 1 inc)


(find-n-when-satisfy-tolerance
 (lambda (k) (cont-frac-iter (lambda (i) 1.0)
							 (lambda (i) 1.0)
							 k))
 (/ 1 1.6180327868852458) 0.0001 1 inc)

(/ 1 1.6180327868852458)

