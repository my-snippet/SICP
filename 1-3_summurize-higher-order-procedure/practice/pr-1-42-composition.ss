#lang racket

(define (inc x)
  (+ x 1))

(define (square n)
  (* n n))

(define (compose f g)
  (lambda (x) (f (g x))))

((compose square inc) 6)