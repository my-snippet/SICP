(load "lib/basic/operations.scm")


(define (pascal-value n k)
  (if (and (= k 0) (= k n))
	  1
	  (combination n k)))

(define (pascal n)
  (define (pascal-iter row col result count)
	(cond ((= count 0) result)
		  ((> col row) (pascal-iter (+ row 1) 0 result (- count 1)))
		  (else
		   (pascal-iter row (+ col 1) (append result
											  (cons (pascal-value row col)
													())) (- count 1)))))
  (pascal-iter 0 0 () n))
