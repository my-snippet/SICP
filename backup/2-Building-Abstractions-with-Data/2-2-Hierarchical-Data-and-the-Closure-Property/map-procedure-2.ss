#lang racket


(map (lambda (x) (* x x))
     (list 1 2 3 4 5))

(define (scale-list-old items factor)
  (if (null? items)
      null
      (cons (* (car items) factor)
            (scale-list-old (cdr items) factor))))
  

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))

(scale-list-old (list 1 2 3 4 5) 5)
(scale-list (list 1 2 3 4 5) 5)