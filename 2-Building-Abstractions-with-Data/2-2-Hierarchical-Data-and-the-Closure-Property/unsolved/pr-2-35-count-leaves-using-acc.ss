#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate ?
              null
              (map ? ?)))

(count-leaves (list (list 1 (list 2 3) 4)))
(list (list 1 (list 2 3) 4))