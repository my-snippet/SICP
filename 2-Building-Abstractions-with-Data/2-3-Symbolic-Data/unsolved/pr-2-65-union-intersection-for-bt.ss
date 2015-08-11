#lang racket

(require "../../../modules/2/list-to-tree.ss")
(require "../../../modules/2/tree-to-list.ss")

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))


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


(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond (= x1 x2)
              (cons x1
                    (intersection-set (cdr set1) (cdr set2)))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((> x1 x2)
               (intersection-set set1 (cdr set2)))))))


(define bt1 (list->tree (list 1 3 5 7 9 11)))