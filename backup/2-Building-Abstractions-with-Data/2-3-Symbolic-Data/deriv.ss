#lang racket

(define (variable? x)
  ;; symbol? checks if x is characters or not
  (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (make-sum a1 a2)
  (list '+ a1 a2))

(define (make-product m1 m2)
  (list '* m1 m2))

(define (augend s)
  (cadr s))

(define (addend s)
  (caddr s))

(define (multiplicand p)
  (cadr p))

(define (multiplier p)
  (caddr p))


;; following procedure (deriv) use 4 case
;; dc/dx = 0 (c = constant, other variable)
;; dx/dx = 1
;; d(u+v)/dx = du/dx + dv/dx
;; d(uv)/dx = u(d(v)/dx) + v(d(u)/dx)
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

(deriv '(+ x 3) 'x)
(deriv '(* 3 x) 'x)
(deriv '(* x x) 'x)
(deriv '(* x y) 'x)

;; need more simple
(deriv '(* (* x y) (+ 3 x)) 'x)