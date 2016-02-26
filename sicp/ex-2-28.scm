;; The reason why it checks null? : because (list '()) makes nested list -> ('())
;; Therefore it makes many '() value in the flat lists
(define (fringe-version0 x)
  (cond ((null? x) '())
		((pair? x) (append (fringe-version0 (car x))
						   (fringe-version0 (cdr x))))
		(else (list x))))


;; code reference
;; http://www.billthelizard.com/2011/02/sicp-228-flattening-nested-lists.html
;; It is more fit into design patterns
;; it specifies the purpose of argument value as name,
;; and it loacates the main process in the else clause.
(define (fringe tree)
  (cond ((null? tree) '())
		((not (pair? tree)) (list tree))
		(else (append (fringe (car tree))
					  (fringe (cdr tree))))))
