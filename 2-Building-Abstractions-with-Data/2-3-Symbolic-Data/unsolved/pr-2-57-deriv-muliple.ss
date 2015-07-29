#lang racket

(require "../../modules/deriv-refac.ss")

(define (next-seq l)
  ((lambda (next)
     (display next)
     (newline)
     (cond ((or (not (pair? next)) (null? next)) 0)
           (else (append (list (car l)) next))))
  (cdr (cdr l))))

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
  (next-seq s))

(define (multiplicand p)
  (cadr p))

(define (multiplier p)
  (caddr p))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        (else
         (error "unknown expression type -- DERIV" exp))))

(deriv '(+ (+ x y x) (+ x x x y x)) 'x)
;(deriv '(+ (* x y) (* x x)) 'x)