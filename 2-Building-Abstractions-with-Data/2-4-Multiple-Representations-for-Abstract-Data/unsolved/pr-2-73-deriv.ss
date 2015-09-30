(define (deriv exp var)
  (cond ((number? exp) 0)
		((variable? exp) (if (same-variable? exp var) 1 0))
		(else ((get 'deriv (operator exp))
			   (operand exp)
			   var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
