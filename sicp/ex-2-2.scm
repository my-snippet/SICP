(load "lib/basic/operations.scm")


(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (print-segment s)
  (newline)
  (display "(")
  (print-point (start-segment s))
  (display ",")
  (print-point (end-segment s))
  (display ")"))


#| this implementation is quite simple, 
;; but it's more good when it uses functions as point of segment, not pair(car, cdr)
(define (midpoint-segment s)
  (let ((mid-x (average (cadr s) (caar s)))
		(mid-y (average (cddr s) (cdar s))))
	(cons mid-x mid-y)))
|#

;; reference : http://www.billthelizard.com/2010/09/sicp-22-line-segments-in-plane.html
(define (midpoint-segment s)
  (let ((mid-x (average (x-point (start-segment s))
						(x-point (end-segment s))))
		(mid-y (average (y-point (start-segment s))
						(y-point (end-segment s)))))
	(make-segment mid-x mid-y)))
