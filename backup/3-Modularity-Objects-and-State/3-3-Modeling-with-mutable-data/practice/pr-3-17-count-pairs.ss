
(define (count-pairs x)
  (cond ((not (pair? x)) 0)
		((null? (cdr x)) (count-pairs (car x)))
		(else
		 (+ (count-pairs (car x))
			(count-pairs (cdr x))
			1))))


(define x (cons 'a (cons 'b '())))
(define y (list (list 'a 'b) (list 'c 'd)))
(define z (list (list (list 'a 'b) 'c) (list 'd 'e)))
x
y
z
(count-pairs x)
(count-pairs y)
(count-pairs z)
(null? '())
