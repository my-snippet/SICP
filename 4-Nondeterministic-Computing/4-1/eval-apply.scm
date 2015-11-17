;; This chapter have a need to be read repeatedly at regular intervals
;; (eval & apply chapter)


(define (self-evaluating? exp)
  ;; The only self-evaluating items are numbers and strings:
  (cond ((number? exp) true)
		((string? exp) true)
		(else false)))

(define (variable? exp)
  ;; Variables are represented by symbols:
  (symbol? exp))

(define (quoted? exp)
  (tagged-list? exp 'quote))

(define (text-of-quotation exp)
  (cadr exp))

(define (tagged-list? exp tag)
  (if (pair? exp)
	  (eq? (car exp) tag)
	        false))

(define (assignment? exp)
  (tagged-list? exp 'set!))

(define (assignment-variable exp)
  (cadr exp))

(define (assignment-value exp) (caddr exp))

(define (definition? exp)
  (tagged-list? exp 'define))

(define (definition-variable exp)
  (if (symbol? (cadr exp))
	  (cadr exp)
	  (caadr exp)))

(define (definition-value exp)
  (if (symbol? (cadr exp))
	  (caddr exp)
	  (make-lambda
	   (cdadr exp)   ; formal parameters
	          (cddr exp)))) ; body

(define (lambda? exp)
  (tagged-list? exp 'lambda))
(define (lambda-parameters exp) (cadr exp))
(define (lambda-body exp) (cddr exp))
(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))

(define (if? exp) (tagged-list? exp 'if))
(define (if-predicate exp) (cadr exp))
(define (if-consequent exp) (caddr exp))
(define (if-alternative exp)
  (if (not (null? (cdddr exp)))
	  (cadddr exp)
	  'false))

(define (make-if predicate
				 consequent
				 alternative)
  (list 'if
		predicate
		consequent
		alternative))

(define (begin? exp)
  (tagged-list? exp 'begin))
(define (begin-actions exp) (cdr exp))
(define (last-exp? seq) (null? (cdr seq)))
(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))

(define (sequence->exp seq)
  (cond ((null? seq) seq)
		((last-exp? seq) (first-exp seq))
		(else (make-begin seq))))

(define (make-begin seq) (cons 'begin seq))

(define (application? exp) (pair? exp))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
(define (no-operands? ops) (null? ops))
(define (first-operand ops) (car ops))
(define (rest-operands ops) (cdr ops))

(define (list-of-values exps env)
  ;; Why map isn't used? : Because the evaluator
  ;; can be implemented without any use of higher-order-functions
  (if (no-operands? exps)
	  '()
	  (cons (eval (first-operand exps) env)
			(list-of-values
			 (rest-operands exps)
			 env))))

(define (eval exp env)
  ;; Eval takes as arguments an expression and an environment.
  ;; It classifies the expression and directs its evaluation.
  (cond ((self-evaluating? exp)
		 exp)
		((variable? exp) (lookup-variable-value exp env))
		(else
		 (error "Unknown expressions" exp))
		))

(eval 1 2) ;; self-evaluating true
(eval 'a 2) ;; self-evaluating false


(load "../../modules/testing.scm")
(test-begin "eval-test")
