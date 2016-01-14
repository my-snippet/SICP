(load "chap-1-1-7")


(define (new-if predicate
				then-clause
				else-clause)
  (cond (predicate then-clause)
		(else else-clause)))

(define (sqrt-iter-new-if guess x)
  (display guess)
  (new-if (good-enough? guess x)
		  guess
		  (sqrt-iter-new-if (improve guess x) x)))
(define (sqrt-new-if x)
  (sqrt-iter-new-if 1.0 x))

;;(sqrt-new-if 2)
;;(map (lambda (x) (sqrt-new-if x)) (list 1 2 3 4 5))
;; It causes a stack overflow by recursion.


;; Reverse the order of predicate expressions
;; But result was same.
(define (new-new-if predicate
				then-clause
				else-clause)
  (cond ((not predicate) else-clause)
		(else then-clause)))

(define (sqrt-iter-new-new-if guess x)
  (display guess)
  (new-if (good-enough? guess x)
		  guess
		  (sqrt-iter-new-new-if (improve guess x) x)))
(define (sqrt-new-new-if x)
  (sqrt-iter-new-new-if 1.0 x))

;;(sqrt-new-new-if 2)
