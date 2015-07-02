#lang racket

;; You could find derivative value by Newton's law
;; Idea
;; f(x) = x(n+1) = x(n) - g(x)/Dg(x)
;;
;; Induction
;; y = 0 = ax(n+1) + b, (a = Dg(x))
;; 0 = Dg(x)x(n+1) + g(x) - Dg(x)x(n)
;; x(n+1) = x(n) - g(x)/Dg(x)

