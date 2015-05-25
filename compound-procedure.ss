#lang racket
(define (square x) (* x x))
(define (3rd-square x) (* (square x) (square x)))

(square 3)
(3rd-square 3)