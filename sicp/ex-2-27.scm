;; code reference : http://community.schemewiki.org/?sicp-ex-2.27


;; wow.
(define (deep-reverse t)
  (if (pair? t)
	  (reverse (map deep-reverse t))
	  t)) 

;; It uses inner data using let for readibility
;; car, cdr signs are a little confused.
(define (deep-reverse-2 x)
  (if (not (pair? x))
	  x
	  (append (deep-reverse-2 (cdr x))
			                  (list (deep-reverse-2 (car x))))))

;; This method is a kind of interleaving.
;; (a) is (a nil) actually.
;; 'append' procedure uncovers a parenthesis of second argument
;; Therefore (list ...) is covered to second argument
(define (deep-reverse-3 x)
  (cond ((null? x) '())
		((pair? (car x))
		 (append (deep-reverse-3 (cdr x))
				 (list (deep-reverse-3 (car x)))))
		(else (append (deep-reverse-3 (cdr x))
					  (list (car x))))))

;; http://community.schemewiki.org/?sicp-ex-2.27 by varoun
;; iterative version
;; think about the flow of results
;; it seems that one man is rowing the boat while another man
;; is checking the depths of the sea.
(define (deep-reverse-4 tree)
  (define (iter t result)
	(cond ((null? t) result)
		  ((not (pair? (car t)))
		   (iter (cdr t) (cons (car t) result)))
		  (else
		   (iter (cdr t) (cons (deep-reverse-4 (car t)) result)))))
  (iter tree '())) 


;; http://community.schemewiki.org/?sicp-ex-2.27 by shyam
;; it is not a iterative implementations actually because the process have
;; a position to return, in other words process makes stacks to return,
;; that is, it is rather a recursive, not iterative.
(define (deep-reverse-5 items)
  (define (iter items result)
	(if (null? items)
		result
		(if (pair? (car items))
			(let ((x (iter (car items) ())))
			  (iter (cdr items) (cons x result)))
			(iter (cdr items) (cons (car items) result)))))
  (iter items ())) 
