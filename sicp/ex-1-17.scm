(load "lib/basic/operations.scm")


;; idea : when even, do double
(define (*_ a b)
  (define (*_-iter a b result)
	(cond ((= b 0) result)
		  ((even? b) (*_-iter (double a) (halve b) result))
		  (else (*_-iter a (- b 1) (+ result a)))))
  (*_-iter a b 0))

(define (*-recursive a b) 
  (cond ((= b 0) 0)
		((even? b) (+ (double a) (*-recursive (double a) (halve b))))
		(else (+ a (*-recursive a (- b 1))))))
