#lang racket

(list 1 2 3 4 5)
(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null)))))

(define one-to-five (list 1 2 3 4 5))
(define cons-one-to-five
  (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null))))))

one-to-five
cons-one-to-five

(car one-to-five)
(cdr one-to-five)

(car cons-one-to-five)
(cdr cons-one-to-five)
;;
;;
;; 'n'th element of list
;; * Start with 0
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(list-ref one-to-five 3)