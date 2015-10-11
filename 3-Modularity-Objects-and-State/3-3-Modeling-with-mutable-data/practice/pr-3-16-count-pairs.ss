;; I think this cannot works properly when identical lists in a list inserted
(define (count-pairs x)
  (if (not (pair? x))
	  0
	  (+ (count-pairs (car x))
		 (count-pairs (cdr x))
		 1)))


(define x (cons 'a (cons 'b '())))
(define y (list (list 'a 'b) (list 'c 'd)))
x
y
(define identical-lists
  (cons x x))
(count-pairs x)
(count-pairs y)
(count-pairs identical-lists)
