#lang racket

(require "../../../modules/2/ordered-list.ss")

;; but the implementation has complex of THETA(n^2)
;; Is there another way?

;; IDEA
;; If the last number of set1 is smaller than the first number, then just apppend two list
;; this case, complex : THETA(n)

(define (adjoin-set x set)
  (cond ((element-of-set? x set) set)
        ((or (null? set) (< x (car set)))
         (cons x
               set))
        ((> x (car set))
         (cons (car set)
               (adjoin-set x (cdr set))))))

(define (union-set set1 set2)
  (if (null? set1)
      set2
      (union-set (cdr set1) (adjoin-set (car set1) set2))))

(union-set (list 1 2 3 4 5) (list 1 3 5 7 9))