#lang racket

(define (equal? str1 str2)
  (cond ((xor (pair? str1) (pair? str2)) false)
        ((pair? str1) (and (equal? (car str1) (car str2))
                           (equal? (cdr str1) (cdr str2))))
        (else (if (eq? str1 str2)
                  true
                  false))
      ))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
(equal? '(this (is a) list) '(this (is a) list))