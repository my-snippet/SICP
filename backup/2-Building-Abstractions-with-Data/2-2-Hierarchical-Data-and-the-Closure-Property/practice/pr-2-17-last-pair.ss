#lang racket

(define one-to-five (list 1 2 3 4 5))
(define evens (list 2 4 6 8))

(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))

(last-pair one-to-five)
(last-pair evens)