#lang racket

(define (adjoin-set x set)
  (cond ((or (null? set) (< x (car set)))
         (cons x
               set))
         ((> x (car set))
          (cons (car set)
                  (adjoin-set x (cdr set))))))

(adjoin-set 4 (list 1 3 5 7))
(adjoin-set 4 '())


;; if elements are ordered,
;; program can judge the position should be lower or higher

;; if insert a element into a list has elements of the number or  n

;; it can be inserted just once if lucky
;; or it can be inserted after trying n times if unlucky

;; Its complexity THETA(n) but, Average n/2 times in reality