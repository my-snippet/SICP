#lang racket

;; I don't understand what this problems demand

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m)
  (if (pair? m)
      (car m)
      m))

(define (right-branch m)
  (if (pair? m)
      (car (cdr m))
      m))

(define (branch-length m)
  (if (null? m)
      0
      (+ 1 (branch-length (cdr m)))))

(define m1 (make-mobile 5 9))
(left-branch m1)
(right-branch m1)
(branch-length m1)