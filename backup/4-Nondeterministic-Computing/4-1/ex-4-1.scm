(define (is-same-lists l1 l2)
  ;; are l1 & l2 same lists? (pre-requisites : 1-dimension, same length)
  (cond ((and (null? l1) (null? l2))
		 true)
		((and (number? l1) (number? l2))
		 (= l1 l2))
		(else
		 (if (not (= (car l1) (car l2)))
			 false
			 (is-same-lists (cdr l1) (cdr l2))))))


(define (list-of-values-original exps env)
  (if (no-operands? exps)
	  '()
	  (cons (eval (first-operand exps) env)
			(list-of-values-original
			 (rest-operands exps)
			 env))))

(define (list-of-values-from-right-to-left exps env)
  (if (no-operands? exps)
	  '()
	  (append (list-of-values-from-right-to-left
			   (rest-operands exps)
			   env)
			  (cons (eval (first-operand exps) env) '()))))

(define (eval exp env)
  ;; dummy eval, just return exp
  exp)


(list-of-values-from-right-to-left (list 1 2 3) 'env)
(load "../../modules/testing.scm")
(test-begin "test-list-of-values")

(test-assert (is-same-lists (list 3 2 1)
							(list-of-values-from-right-to-left (list 1 2 3) 'env)))

(test-end "test-list-of-values")
