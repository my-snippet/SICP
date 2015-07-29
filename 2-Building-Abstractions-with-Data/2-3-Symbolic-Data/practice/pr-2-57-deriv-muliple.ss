#lang racket

(require "../../modules/deriv-refac.ss")


;; IDEA
;; + (derivatives of addition) :
;; d(a+b+c+d)/dx = a' + b' + c' + d'
;; (make-sum a1 (make-sum (+ a2 a3 ... an)))
;;
;; * (derivatives of productiion) :
;; d(abcd)/dx = d(QW)/dx = Q'W + QW' = a'bcd + a(bcd)'
;; = a'bcd + (a(b'cd + b(c'd + cd'))


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
  ((lambda (next)
     (cond ((or (not (pair? next)) (null? next)) 0)
           (else (append (list (car s)) next))))
  (cdr (cdr s))))

(define (multiplicand p)
  (cadr p))


;; First, check () or null passed : like (* x null) -> then 1
;; Second, check 4th value exist : like (* a1 a2 a3 ...) 
;; -> then append (a2 a3 ...) with (*), if not, just return a2
(define (multiplier p)
  (cond ((null? p) 1)
        ((pair? p) ((lambda (next)
                      (if (pair? (cdr next))
                          (append (list (car p)) next)
                          (car next)))
                    (cdr (cdr p))))
        (else p)))


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

(deriv '(+ (+ x y (* x x)) (+ x x (* 4 x) y x)) 'x)
(deriv '(* x x) 'x)
(deriv '(* x x x) 'x)
(deriv '(* x x x x) 'x)
(deriv '(* x x y) 'x)
(deriv '(* (+ x y) (+ x x)) 'x)