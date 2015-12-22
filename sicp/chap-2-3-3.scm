(define (element-of-set? x set)
  (cond ((null? set) false)
		((equal? x (car set)) true)
		 (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
	  set
	  (cons x set)))
