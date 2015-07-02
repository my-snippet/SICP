#lang racket

;; You could find derivative value by Newton's law
;; Idea
;; f(x) = x(n+1) = x(n) - g(x)/Dg(x)
;; if g(x) = 0, then x is equal to x |-> f(x) : fixed point
;;
;; Induction
;; y = 0 = ax(n+1) + b, (a = Dg(x))
;; 0 = Dg(x)x(n+1) + g(x) - Dg(x)x(n)
;; x(n+1) = x(n) - g(x)/Dg(x)
;;
;; Dg(x) = {g(x + dx) - g(x)}/dx

(define dx 0.00001)
(define tolerance dx)

(define (cube n)
  (* n n n))

(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))

;; Following Procedure get Procedure argument 
;; and return Procedure
;; original procedure -> procedure transformer -> transformed procedure
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x)) 
       dx)))

((deriv cube) 5)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))


(newtons-method cube 1.0)