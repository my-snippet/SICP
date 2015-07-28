#lang racket

(require "../../modules/deriv.ss")
(require "../../modules/deriv-refac.ss")
(require "../../../modules/1/fast-exp.ss")

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x)
  (cadr x))

(define (exponent x)
  (caddr x))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        ((and (number? base) (number? exponent)) (fast-exp base exponent))
        (else (list '** base exponent))))

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
        ((exponentiation? exp)
         (make-exponentiation (base exp)
                              (exponent exp)))
        (else
         (error "unknown expression type -- DERIV" exp))))

(deriv '(** 2 0) 'x)