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

;(define (fringe items)

;(fringe x)

;;          t
;;      t       t
;;    t   t   t   t
;; idea : (cons (fringe (car items)) (fringe (cdr items)))