(define (same-parity-version-0 first-value . remained-values)
  (define (even-filter l)
	(cond ((null? l)
		   '())
		  ((even? (car l))
		   (cons (car l) (even-filter (cdr l))))
		  (else (even-filter (cdr l)))))

  (define (odd-filter l)
	(cond ((null? l)
		   '())
		  ((odd? (car l))
		   (cons (car l) (even-filter (cdr l))))
		  (else (even-filter (cdr l)))))

  (if (even? first-value)
	  (cons first-value (even-filter remained-values))
	  (cons first-value (odd-filter remained-values))))

#|
(define (same-parity-version-1 first-value . remained-values)
  (define (remainder-by-2 value)
	(remainder value 2))

  (define (iter 
  
  (let ((parity-of-first-value (remainder-by-2 first-value)))
	(cond ((null? remained-values)
		   '())
		  ((= parity-of-first-value (remainder-by-2 (car remained-values))
		   (cons first-value (even-filter remained-values))
|#
