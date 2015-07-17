#lang racket

(define x (list (list 1 2) (list 3 4)))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (fringe items)
  (define (fringe-inner n)
    (if (< n 0)
        null
        (if (pair? (car items))
            (fringe (car items))
            (cons (fringe (car items))
                    (fringe (cdr items))))))
  (fringe-inner (- (length items) 1)))

(fringe x)