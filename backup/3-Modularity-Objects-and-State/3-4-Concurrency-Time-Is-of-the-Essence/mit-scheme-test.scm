(load "../../modules/3/parallel.scm")

(define (square x)
  (* x x))

(square 3)

(display "dddddddddddd")
(display (square 3))

(stream-car (cons-stream 1 2))

(define x 10)
(parallel-execute (lambda () (set! x (* x x)))
		  (lambda () (set! x (+ x 1))))





















