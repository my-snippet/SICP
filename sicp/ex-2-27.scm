;; http://community.schemewiki.org/?sicp-ex-2.27

;;(define (deep-reverse x)
;;  (let ((h (if (pair? x) (cdr x) x))
;;		(t (if (pair? x) (car x) x)))

;; wow.
(define (deep-reverse t)
  (if (pair? t)
	  (reverse (map deep-reverse t))
	  t)) 

;; It binds recursive call as a consequent using (append ...)
(define (deep-reverse-version1 x)
  (if (pair? x)
	  (append (deep-reverse-version1 (cdr x))
			  (list (deep-reverse-version1 (car x))))
	  x)) 
