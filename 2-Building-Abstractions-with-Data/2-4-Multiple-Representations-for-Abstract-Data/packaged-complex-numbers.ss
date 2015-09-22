;; Unlike the dispatch on type
;; One procedure can include all the interface in the Data-directed programming


(define (install-rectangular-package)
  ;; internal procedures
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (make-from-real-imag x y)
	(cons x y))
  (define (magnitude z)
	(sqrt (+ (square (real-part z))
			 (square (imag-part z)))))
  (define (angle z)
	(atan (real-part z)
		  (imag-part z)))
  (define (make-from-mag-ang r a)
	(cons (* r (cos a)) (* r (sin a))))

  ;; interface to the rest of system
  (define (tag x) (attach-tag 'rectangular x))
  (put 'real-part '(rectangular) real-part)
  (put 'imag-parg '(rectangular) imag-part)
  (put 'magnitude '(rectangular) magnitude)
  (put 'angle '(rectangular) angle)
  (put 'make-from-real-imag 'rectangular
	   (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'rectangular
	   (lambda (r a) (tag (make-from-mag-ang r a))))
  'done)
	   

  
;; polar form
(define (real-part-polar z)
  (* (magnitude-polar z) (cos (angle-polar z))))
(define (imag-part-polar z)
  (* (magnitude-polar z) (sin (angle-polar z))))
(define (magnitude-polar z) (car z))
(define (angle-polar z) (cdr z))
(define (make-from-real-imag-polar x y)
  (attach-tag 'polar
			  (cons (sqrt (+ (square x) (square y)))
					(atan y x))))
(define (make-from-mag-ang-polar r a)
  (attach-tag 'polar
			  (cons r a)))

		   
