(define (accumulate-recur combiner null-value term a next b)
  (if (> a b)
	  null-value
	  (combiner (term a)
				(accumulate-recur combiner null-value term (next a) next b))))

(define (sum-using-acc-recur a term next b)
  (accumulate-recur (lambda (x y) (+ x y)) 0 term a next b))

(define (product-using-acc-recur a term next b)
  (accumulate-recur (lambda (x y) (* x y)) 1 term a next b))
