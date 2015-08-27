(load "../../modules/3/stream.ss")
(load "../../moduels/3/stream-advanced.ss")
(load "../../modules/1/basic-mit-scheme.ss")


(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
		 (stream-map (lambda (guess)
			       (sqrt-improve guess x))
			     guesses)))
  guesses)


(define sqrt-stream-2 (sqrt-stream 2))
;; (display-stream-range sqrt-stream-2 0 10)


(define (pi-summands n)
  (cons-stream (/ 1.0 n)
	       (stream-map - (pi-summands (+ n 2)))))
