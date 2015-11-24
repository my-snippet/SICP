#lang racket

(define (make-accumulator total)
  (lambda (val)
    (begin (set! total (+ total val))
           total)))

(define A (make-accumulator 5))
(A 10)
(A 10)