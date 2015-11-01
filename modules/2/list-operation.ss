;; no racket, use mit scheme
;;#lang racket
;;
;;(provide list-ref
;;         length)
         
         
         
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

;; length
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
