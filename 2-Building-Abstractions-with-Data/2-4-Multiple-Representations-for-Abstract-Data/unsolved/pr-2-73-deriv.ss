;; IDEA :
;; 1. Make install-deriv-package. it contains sum & product operation procedures ( named as make-sum, make-product )
;; 2. extract the operations using 'get'


(define (deriv exp var)
  (cond ((number? exp) 0)
		((variable? exp) (if (same-variable? exp var) 1 0))
		(else ((get 'deriv (operator exp))
			   (operand exp)
			   var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))


(define (install-deriv-package)
  ;; Procedure  
  (define (make-sum a1 a2)
	(cond ((=number? a1 0) a2)
		  ((=number? a2 0) a1)
		  ((and (number? a1) (number? a2)) (+ a1 a2))
		  (else (list '+ a1 a2))))

  (define (make-product m1 m2)
	(cond ((or (=number? m1 0) (=number? m2 0)) 0)
		  ((=number? m1 1) m2)
		  ((=number? m2 1) m1)
		  ((and (number? m1) (number? m2)) (* m1 m2))
		  (else (list '* m1 m2))))

  ;; Interface
  (put op type item)
  (put 'make-sum 'deriv make-sum)
  (put 'make-product 'deriv make-product))


(deriv ('* '(1 x) 'x)
