;; description reference
;; http://www.billthelizard.com/2010/12/sicp-212-216-extended-exercise-interval.html

(load "ex-2-7.scm")
(load "ex-2-12.scm")


(define (mul-interval-approx x y)
  (let ((cx*cy (* (center x) (center y)))
		(px+py (+ (percent x) (percent y))))
	(make-interval (* cx*cy (- 1 (/ px+py 100.0)))
				   (* cx*cy (+ 1 (/ px+py 100.0))))))
