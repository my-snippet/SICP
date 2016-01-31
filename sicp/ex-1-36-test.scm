(load "lib/basic/operations.scm")


;; fixed point
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
	(< (abs (- v1 v2))
	   tolerance))
  (define (try guess)
	(display guess)
	(newline)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		  next
		  (try next))))
  (try first-guess))


;; number of process, accuracy
;; reference: http://www.billthelizard.com/2010/07/sicp-exercise-136-fixed-points-and.html
(define x (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))
(expt x x)

(define x2 (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0))
(expt x2 x2)
