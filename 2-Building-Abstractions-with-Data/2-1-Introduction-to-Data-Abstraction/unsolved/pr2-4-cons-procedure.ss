#lang racket

;; example cons, car, cdr
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else error "only 0 and 1 possible")))
  dispatch)

((cons 11 99) 0)
((cons 11 99) 1)

(define (car z) (z 0))
(define (cdr z) (z 1))

(car (cons 11 99))
(cdr (cons 11 99))
;;

