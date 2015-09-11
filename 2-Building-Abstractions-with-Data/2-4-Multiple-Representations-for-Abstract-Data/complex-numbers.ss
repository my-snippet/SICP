
;;;; Implementation 1
;; Rectangular form
;; x =rcosA, r =√x2 +y2,
;; y = r sin A, A = arctan(y, x),

;; Basic element
(define (real-part z) (car z))
(define (imag-part z) (cadr z))
(define (magnitue z)
  (sqrt (+ (square (real-part z))
	   (square (imag-part z)))))
(define (angle z)
  (atan (imag-part z) (real-part z)))


;; Definition of Complex numbers 
(define (make-from-real-imag x y)
  (cons x y))
(define (make-from-mag-ang r a)
  (cons (* r (cos a)) (* r (sin a))))


;;;; Implementation 2

