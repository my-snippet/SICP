#lang racket

(provide variable?
         same-variable?
         sum?
         product?
         augend
         addend
         multiplicand
         multiplier)

(define (variable? x)
  ;; symbol? checks if x is characters or not
  (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (augend s)
  (cadr s))

(define (addend s)
  (caddr s))

(define (multiplicand p)
  (cadr p))

(define (multiplier p)
  (caddr p))