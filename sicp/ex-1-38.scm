(load "ex-1-37.scm")


(define (e-calculation k)
  (+ 2 (cont-frac (lambda (i) 1.0)
				  (lambda (i) (if (= (remainder (+ i 1) 3) 0)
								  (* 2 (quotient (+ i 1) 3))
								  1))
				  k)))
