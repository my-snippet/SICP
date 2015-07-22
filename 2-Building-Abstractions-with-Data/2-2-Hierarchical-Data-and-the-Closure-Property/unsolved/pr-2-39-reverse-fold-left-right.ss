#lang racket

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-fold-right sequence)
  (fold-right (lambda (x y) (cons x y)) null sequence))

(define (reverse-fold-left sequence)
  (fold-left (lambda (x y) 0) null sequence))

(reverse-fold-right (list 1 2 3))