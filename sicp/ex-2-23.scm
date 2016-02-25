;; reference : map
(define (map p l)
  (if (null? l)
	  '()
	  (cons (p (car l)) (map p (cdr l)))))


;; The cond syntax embedded (begin)
;; http://sicp.ai.mit.edu/Fall-2003/manuals/scheme-7.5.5/doc/scheme_3.html#SEC39
;; scheme evaluates only one expression or statements, but 'begin' instruction 
;; makes the process evaluates all the expressions until it ends.
(define (for-each p l)
  (cond ((null? l) 'done)
		(else (p (car l)) (for-each p (cdr l)))))
