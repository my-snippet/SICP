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
  (define make-sum ...)
  (define make-product ...)
  ...
  )
	
  ;; Interface
  (put op type item)
  (put 'make-sum 'deriv make-sum)
  (put 'make-product 'deriv make-product))
