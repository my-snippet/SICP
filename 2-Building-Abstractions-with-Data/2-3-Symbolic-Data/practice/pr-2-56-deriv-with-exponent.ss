#lang racket

(require "../../modules/deriv.ss")
(require "../../modules/deriv-refac.ss")
(require "../../../modules/1/fast-exp.ss")


;; Done
;; How can i shorten more?
;; d(u^n)/dx = n * u^(n-1) * du/dx  <<-- too long


;; IDEA
;; make list quote operation sign only,
;; then variable name will be not showing, but the value of variable showing
;; refer "make-exponentiation" procedure


(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x)
  (cadr x))

(define (exponent x)
  (caddr x))

(define (make-exponentiation base exponent var)
  ((lambda (derivated-base)
     (cond ((or (number? base) (=number? exponent 0)) 0)
           ((=number? exponent 1) derivated-base)
           ((=number? derivated-base 0) 0)
           (else (append 
                  (list '* exponent
                  (list '** base (list '- exponent 1))) (list derivated-base)))))
   (deriv base var)))

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
                              (exponent exp)
                              var))
        (else
         (error "unknown expression type -- DERIV" exp))))

(deriv '(** x 0) 'x)
(deriv '(** x 1) 'x)
(deriv '(** x 2) 'x)
(deriv '(** y 2) 'x)
(deriv '(** (* x x) n) 'x)