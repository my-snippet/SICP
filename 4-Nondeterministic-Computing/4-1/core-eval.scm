(define (self-evaluating? exp)
  ;; The only self-evaluating items are numbers and strings:
  (cond ((number? exp) true)
		((string? exp) true)
		(else false)))

(define (variable? exp)
  ;; Variables are represented by symbols:
  (symbol? exp))

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
		((variable? exp) (lookup-variable-value exp env))
		(else
		 (error "Unknown expressions" exp))
		))

(eval 1 2)
