#lang racket

;; Ө(n)
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;; Ө(1)
(define (adjoin-set x set)
  (cons x set))

;; Ө(n^2)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; Ө(n^2)
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (union-set (cdr set1)
                         (adjoin-set (car set1) set2)))))

(intersection-set (list 1 2 1 2 1 2)
                  (list 1 3 1 3 1 3))

(union-set (list 1 2 1 2 1 2)
                  (list 1 3 1 3 1 3))


;; If there are same kind of objects(or product), it will be useful(allow a duplicate)