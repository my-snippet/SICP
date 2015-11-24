(load "../../modules/3/stream-paradigm.ss")


(define (sqrt-improve guess x)
  (average guess (/ x guess)))


(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
		 (stream-map (lambda (guess)
			       (sqrt-improve guess x))
			     guesses)))
  guesses)
;; (display-stream-range (sqrt-stream 2) 0 20)


(define (stream-limit s tolerance)
  (display-line s)
  (let ((next-s (stream-cdr s)))
    (if (> tolerance (abs (- (stream-car s) (stream-car next-s))))
	(stream-car next-s)
	(stream-limit next-s tolerance))))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))
(sqrt 1779 0.0000000001)
