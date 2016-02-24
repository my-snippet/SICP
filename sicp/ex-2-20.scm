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
		   (cons (car l) (odd-filter (cdr l))))
		  (else (odd-filter (cdr l)))))

  (if (even? first-value)
	  (cons first-value (even-filter remained-values))
	  (cons first-value (odd-filter remained-values))))


;; exercise2.20 requires the procedure takes one or more integers
;; to seperate implementation(inner procedure) and first proecure
;; it cons up first-value and remained-values when calling inner
;; proceure
(define (same-parity? a b)
  (= (remainder a 2) (remainder b 2)))

(define (same-parity-version-1 first-value . remained-values)
  (define (recur l)
	(cond ((null? l)
		   '())
		  ((same-parity? first-value (car l))
		   (cons (car l) (recur (cdr l))))
		  (else
		   (recur (cdr l)))))
  (recur (cons first-value remained-values)))


(define (same-parity-version-2 first-value . remained-values)
  (define (recur l)
	(cond ((null? l)
		   '())
		  ((same-parity? first-value (car l))
		   (append (list (car l)) (recur (cdr l))))
		  (else
		   (recur (cdr l)))))
  (recur (cons first-value remained-values)))

(define (same-parity-version-3 first-value . remained-values)
  (define (iter l result)
	(cond ((null? l)
		   result)
		  ((same-parity? first-value (car l))
		   (iter (cdr l) (append result (list (car l)))))
		  (else
		   (iter (cdr l) result))))
  (iter remained-values (list first-value)))
