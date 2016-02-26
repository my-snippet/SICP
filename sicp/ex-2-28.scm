;; This idea(using map) is inspired by ex2.27 
(define (flat-1d tree)
  (append (car x) (cadr x)))

(define (fringe tree)  
  (cond ((null? tree) '())
		((not (pair? tree)) (list tree))
		(else (fringe (map flat-1d tree)))))


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
(define (fringe-version1 tree)
  (cond ((null? tree) '())
		((not (pair? tree)) (list tree))
		(else (append (fringe-version1 (car tree))
					  (fringe-version1 (cdr tree))))))

;; code reference
;; http://community.schemewiki.org/?sicp-ex-2.28
;; iterative version
(define (fringe-version2 T)
  (define (iter T R)
	(cond ((null? T) R)
		  ((not (pair? T)) (cons T R))
		  (else (iter (car T)
					  (iter (cdr T) R)))))
  (iter T '()))
