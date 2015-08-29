(load "../../modules/3/stream.ss")
(load "../../modules/3/stream-advanced.ss")
(load "../../modules/1/basic-mit-scheme.ss")
;; (load "practice/pr-3-55-partial-sums.ss")


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


(define pi-stream
  (scale-stream (partial-sums (pi-summands 1)) 4))
(display-stream-range pi-stream 0 15)


(define (euler-transform s)
  (let ((s0 (stream-ref s 0))
	(s1 (stream-ref s 1))
	(s2 (stream-ref s 2)))
    (cons-stream (- s2 (/ (square (- s2 s1))
			  (+ s0 (* -2 s1) s2)))
		 (euler-transform (stream-cdr s)))))
(display-stream-range (euler-transform pi-stream) 0 15)

(define (make-tableau transform s)
  (cons-stream s (make-tableau transform (transform s))))
;; (display-stream-range (make-tableau euler-transform pi-stream) 0 15)


(define (accelerated-sequence transform s)
  (stream-map stream-car
	      (make-tableau transform s)))
(display-stream-range (accelerated-sequence euler-transform pi-stream) 0 15)
