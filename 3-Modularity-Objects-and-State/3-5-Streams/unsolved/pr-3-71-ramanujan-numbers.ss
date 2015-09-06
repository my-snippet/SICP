(load "infinite-stream-of-pairs.ss")


;; (display-stream-range (pairs integers integers) 0 10)
(define (cube x)
  (* x (square x)))


(define (stream-of-cube s)
  (if (stream-null? s)
      the-empty-stream
      (let ((value-of-cube (cube (stream-car s))))
	(cons-stream value-of-cube
		     (stream-of-cube (stream-cdr s))))))


(define integers-of-cube
  (stream-of-cube integers))


;; (display-stream-range integers-of-cube 0 10)
;; (display-stream-range integers-ofcube 0 10)

;;(define pairs-of-triple-numbers
;;  (pairs integers integers))
