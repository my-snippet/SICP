;; The exercise is easy to understand but
;; it requires clean descriptions.
;; I try to describe well but I am not sure it is. 

;; First version construct present result as car and previous results as cdr
;; Therefore items are constructed in reverse.
;; The order of cons up should be in reverse.
(define (square-list-verion-0 items)
  (define (iter things answer)
	(if (null? things)
		answer
		(iter (cdr things)
			  (cons (square (car things))
					answer))))
  (iter items nil))

;; Second version construct list as car and integer as cdr
;; Therefore it makes nested list continously.
;; -> The data type should be equal.
(define (square-list-version-1 items)
  (define (iter things answer)
	(if (null? things)
		answer
		(iter (cdr things)
			  (cons answer
					(square
					 (car things))))))
  (iter items nil))
