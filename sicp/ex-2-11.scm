;; description reference
;; http://www.billthelizard.com/2010/12/sicp-27-211-extended-exercise-interval.html


;; It will be helpful to think of absolute values when multiplying each interval
;; negative * negative > negative * positive( also 0 included )


(define (mul-interval-9-cases x y)
  (let ((ux (upper-bound x))
		(lx (lower-bound x))
		(uy (upper-bound y))
		(ly (lower-bound y)))
	(let ((++*++? (and (and (>= lx 0) (>= ux 0))
					   (and (>= ly 0) (>= uy 0))))
		  (++*-+? (and (and (>= lx 0) (>= ux 0))
					   (and (< ly 0) (>= uy 0))))
		  (++*--? (and (and (>= lx 0) (>= ux 0))
					   (and (< ly 0) (< uy 0))))
		  (-+*++? (and (and (< lx 0) (>= ux 0))
					   (and (>= ly 0) (>= uy 0))))
		  (-+*-+? (and (and (< lx 0) (>= ux 0))
					   (and (< ly 0) (>= uy 0))))
		  (-+*--? (and (and (< lx 0) (>= ux 0))
					   (and (< ly 0) (< uy 0))))
		  (--*++? (and (and (< lx 0) (< ux 0))
					   (and (>= ly 0) (>= uy 0))))
		  (--*-+? (and (and (< lx 0) (< ux 0))
					   (and (< ly 0) (>= uy 0))))
		  (--*--? (and (and (< lx 0) (< ux 0))
					   (and (< ly 0) (< uy 0)))))
	  (cond (++*++? (make-interval (* lx ly) (* ux uy)))
			(++*-+? (make-interval (* ux ly) (* ux uy)))
			(++*--? (make-interval (* ux ly) (* lx ly)))
			(-+*++? (make-interval (* lx uy) (* ux uy)))
			
			;; -+*-+? need one more multiplications
			;; [- +] * [- +]
			(-+*-+? (make-interval (min (* lx uy) (* ux ly))
								   (max (* ux uy) (* lx ly))))
			
			(-+*--? (make-interval (* ux ly) (* lx ly)))
			(--*++? (make-interval (* lx uy) (* lx uy)))
			(--*-+? (make-interval (* lx uy) (* lx ly)))
			(--*--? (make-interval (* ux uy) (* lx ly)))			
			(else (error "Invalid value may have been passed"))))))
;; ... needed to implement about all cases
