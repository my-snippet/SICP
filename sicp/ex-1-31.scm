(define (product a term next b)
  (define (iter a result)
	(if (> a b)
		result
		(iter (next a) (* (term a) result))))
  (iter a 1))

(define (product-recur a term next b)
  (if (> a b)
	  1
	  (* (term a) (product-recur (next a) term next b))))

(define (pi-using-product n)
  ;; To minimize the size of value, do a division at each process
  ;; pi = 4 * ( (3^2-1)/3^2 * (5^2-1)/5^2 * ... )
  (* 4.0 (product 3
				  (lambda (x) (/ (- (square x) 1) (square x)))
				  (lambda (x) (+ x 2))
				  n)))
