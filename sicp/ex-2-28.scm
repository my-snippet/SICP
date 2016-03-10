;; This makes error because 'map' operation does not append hierarchical list
;; I think apply will may be used, not map.
;; (define (flat-1d tree)
;;   (cdr tree));;(append (car x) (cdr x)))
;; (define (fringe tree)
;;   (display tree) (newline) 
;;   (if (pair? tree)
;; 	  (fringe (map flat-1d tree))
;; 	  tree))

;; it flattens tree 1 level(dimension)
(define (flat-1d x)
  (append (fringe (car x))
		  (fringe (cdr x))))

(define (fringe tree)
  (cond ((null? tree) '())
		((not (pair? tree)) (list tree))
		(else (flat-1d tree))))

;; The reason why it checks null? : because (list '()) makes nested list -> ('())
;; Therefore it makes many '() value in the flat lists
(define (fringe-2 x)
  (cond ((null? x) '())
		((pair? x) (append (fringe-2 (car x))
						   (fringe-2 (cdr x))))
		(else (list x))))


;; code reference
;; http://www.billthelizard.com/2011/02/sicp-228-flattening-nested-lists.html
;; It is more fit into design patterns
;; it specifies the purpose of argument value as name,
;; and it loacates the main process in the else clause.
(define (fringe-3 tree)
  (cond ((null? tree) '())
		((not (pair? tree)) (list tree))
		(else (append (fringe-3 (car tree))
					  (fringe-3 (cdr tree))))))

;; code reference
;; http://community.schemewiki.org/?sicp-ex-2.28
;; It is similar to deep-reverse-5 of ex.2.27
;; it is not a iterative implementations. refer to
;; deep-reverse-5 of ex.2.27
(define (fringe-4 T)
  (define (iter T R)
	(cond ((null? T) R)
		  ((not (pair? T)) (cons T R))
		  (else (iter (car T)
					  (iter (cdr T) R)))))
  (iter T '()))
