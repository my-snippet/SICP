(define (power a n)
  (if (= n 0)
	  1
	  (* a (power a (- n 1)))))
