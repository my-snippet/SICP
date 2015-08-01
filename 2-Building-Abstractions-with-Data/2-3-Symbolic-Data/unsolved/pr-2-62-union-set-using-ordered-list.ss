#lang racket

(require "../../../modules/2/ordered-list.ss")

(define (union-set set1 set2)
  (if (null? set1)
      set2
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2) (union-set (cdr set1) (cdr set2)))
              ((< x1 x2) (union-set (cdr set1) (c))