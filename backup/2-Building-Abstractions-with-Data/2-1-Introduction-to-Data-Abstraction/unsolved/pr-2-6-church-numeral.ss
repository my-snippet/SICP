#lang racket

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(add-1 zero)

;; I don't understand what problem demand

;; substitution demand
;; 1. (add-1 zero)
;; 2. (lambda (f) (lambda (x) (f ((zero f) x)))))
;; 3. (lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) x))) x)))))
;; 4. (lambda (f) (lambda (x) (f x)))))
;; 5. (lambda (f) (lambda (x) (f x)))))