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
		(append (deep-reverse-version0 h)
				(list (deep-reverse-version0 t))))))

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

;; http://community.schemewiki.org/?sicp-ex-2.27 by varoun
;; iterative version
;; think about the flow of results
;; it seems that one man is rowing the boat while another man
;; is checking the depths of the sea.
(define (deep-reverse-version3 tree)
  (define (iter t result)
	(cond ((null? t) result)
		  ((not (pair? (car t)))
		   (iter (cdr t) (cons (car t) result)))
		  (else
		   (iter (cdr t) (cons (deep-reverse (car t)) result)))))
  (iter tree '())) 


;; http://community.schemewiki.org/?sicp-ex-2.27 by shyam
;; iterative version 2, this style is similiar to ex2.32
(define (deep-reverse-version4 items)
  (define (iter items result)
	(if (null? items)
		result
		(if (pair? (car items))
			(let ((x (iter (car items) ())))
			  (iter (cdr items) (cons x result)))
			(iter (cdr items) (cons (car items) result)))))
  (iter items ())) 
