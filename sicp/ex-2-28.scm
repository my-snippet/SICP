;; The reason why it checks null? : because (list '()) makes nested list -> ('())
;; Therefore it makes many '() value in the flat lists
(define (fringe-version0 x)
  (cond ((null? x) '())
		((pair? x) (append (fringe-version0 (car x))
						   (fringe-version0 (cdr x))))
		(else (list x))))
