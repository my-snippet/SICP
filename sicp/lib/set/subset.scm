(load "lib/set/basic.scm")

(define (subset? sub-set super-set)
  (cond ((null? sub-set) true)
		((null? super-set) false)
		((not (element-of-set? (car sub-set) super-set)) false)
		(else (subset? (cdr sub-set) super-set))))
