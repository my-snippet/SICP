#lang racket

(require "../../../modules/2/set-with-unordered-list.ss")


;; notice : this procedure is iterative, not recursive
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        (else (union-set (cdr set1)
                         (adjoin-set (car set1) set2)))))

(union-set (list 0 1 2 3 4) (list 3 4 5 6))