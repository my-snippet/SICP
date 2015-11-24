#lang racket

(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y)
(cons x y)
(list x y)

;; append : big one
;; cons : one and remainee
;; list : one and one