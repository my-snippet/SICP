#lang racket

(require "../../../modules/2/binary-tree.ss")

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1
                     (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))


(define l1 (list 2 null null))
(define r1 (list 4 null null))
(define t1 (make-tree 2 l1 r1))

t1
(left-branch t1)
(right-branch t1)

(tree->list-1 t1)
(tree->list-2 t1)