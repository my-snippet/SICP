;; description reference
;; http://www.billthelizard.com/2010/12/sicp-27-211-extended-exercise-interval.html

(define (mul-interval x y)
  (let ((ux (upper-bound x))
		(lx (lower-bound x))
		(uy (upper-bound y))
		(ly (lower-bound y)))
	(cond ((and (and (> lx 0) (> ux 0))
				(and (> ly 0) (> uy 0)))		  
		   (make-interval (* lx ly) (* ux uy)))
		  ((and (and (> lx 0) (> ux 0))
				(and (< ly 0) (> uy 0)))		  
		   (make-interval (* lx ly) (* ux uy)))
;; ... needed to implement about all cases
