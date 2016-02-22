(load "ex-2-7.scm")

;; description ref
;; http://www.billthelizard.com/2010/12/sicp-27-211-extended-exercise-interval.html
;; If y range spans zero, then div-interval makes the interval element order incorrect
;; lower-bound and upper-bound will be reversed each other.

;; code ref
;; http://community.schemewiki.org/?sicp-ex-2.10
(define (div-interval x y)
  (if (>= 0 (* (lower-bound y) (upper-bound y)))
	  (error "Division error (interval spans 0)" y)
	  (mul-interval x
					(make-interval (/ 1. (upper-bound y))
								   (/ 1. (lower-bound y))))))
