#lang racket

(require "../../modules/deriv.ss")
(require "../../modules/deriv-refac.ss")

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x)
  (cadr x))

(define (exponent x)
  (caddr x))

(define (make-exponentiation base exponent)
  0)

;; following procedure (deriv) use 4+3 case
;; dc/dx = 0 (c = constant, other variable)
;; dx/dx = 1
;; d(u+v)/dx = du/dx + dv/dx
;; d(uv)/dx = u(d(v)/dx) + v(d(u)/dx)

;; y + 0 = 0 + y = y
;; y * 1 = 1 * y = y
;; y * 0 = 0 * y = 0

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
