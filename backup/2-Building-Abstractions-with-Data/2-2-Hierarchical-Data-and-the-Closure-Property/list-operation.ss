#lang racket

(list 1 2 3 4 5)
(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null)))))

(define one-to-five (list 1 2 3 4 5))
(define cons-one-to-five
  (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null))))))
(define evens (list 2 4 6 8))

one-to-five
cons-one-to-five

(car one-to-five)
(cdr one-to-five)

(car cons-one-to-five)
(cdr cons-one-to-five)


;; 'n'th element of list
;; * Start with 0
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(list-ref one-to-five 3)


;; length
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (length-iter items)
  (define (length-iter-inner items result)
    (if (null? items)
        result
        (length-iter-inner (cdr items) (+ 1 result))))
  (length-iter-inner items 0))

(length one-to-five)
(length-iter one-to-five)


(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(append evens one-to-five)