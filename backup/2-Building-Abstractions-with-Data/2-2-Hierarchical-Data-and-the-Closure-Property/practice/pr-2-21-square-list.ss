#lang racket

(define (square n)
  (* n n))

(define (square-list-without-map items)
  (if (null? items)
      null
      (cons (square (car items))
            (square-list-without-map (cdr items)))))

(define (square-list-with-map items)
  (map square items))

(square-list-without-map (list 1 2 3 4))

(square-list-with-map (list 1 2 3 4))