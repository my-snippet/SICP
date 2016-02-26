;; code reference : http://community.schemewiki.org/?sicp-ex-2.27


;; wow.
(define (deep-reverse t)
  (if (pair? t)
	  (reverse (map deep-reverse t))
	  t)) 

;; It uses inner data using let for readibility
;; car, cdr signs are a little confused.
(define (deep-reverse-version0 x)
  (let ((h (if (pair? x) (cdr x) x))
		(t (if (pair? x) (car x) x)))
	(if (not (pair? x))
		x
		(append (deep-reverse-version3 h)
				(list (deep-reverse-version3 t))))))

;; It binds recursive call as a consequent using (append ...)
(define (deep-reverse-version1 x)
  (if (pair? x)
	  (append (deep-reverse-version1 (cdr x))
			  (list (deep-reverse-version1 (car x))))
	  x)) 

;; This method is a kind of interleaving.
;; (a) is (a nil) actually.
;; 'append' procedure uncovers a parenthesis of second argument
;; Therefore (list ...) is covered to second argument
(define (deep-reverse-version2 x)
  (cond ((null? x) '())
		((pair? (car x))
		 (append (deep-reverse-version2 (cdr x))
				 (list (deep-reverse-version2 (car x)))))
		(else (append (deep-reverse-version2 (cdr x))
					  (list (car x))))))

;; iterative version
;; think about the flow of results
(define (deep-reverse-version3 x)
  (define (iter items result)
	(if (pair? items)
		(iter (cons (iter (car items)
						  result)
					result)
			  result)
		result))
  (iter x '()))		
