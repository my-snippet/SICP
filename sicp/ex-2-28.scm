;; The reason why it checks null? : because (list '()) makes nested list -> ('())
;; Therefore it makes many '() value in the flat lists
(define (fringe t)
  (cond ((null? t) '())
		((not (pair? t)) (list t))
		(else ((pair? t) (append (fringe (car t))
								 (fringe (cdr t)))))))
