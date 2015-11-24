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


(define t1 (list 7 
                 (list 3 
                       (list 1 null null)
                       (list 5 null null))
                 (list 9
                       null
                       (list 11 null null))))
(tree->list-1 t1)
(tree->list-2 t1)


(define t2 (list 3
                 (list 1 null null)
                 (list 7
                       (list 5 null null)
                       (list 9 null (list 11 null null)))))
(tree->list-1 t2)
(tree->list-2 t2)


(define t3 (list 5 
                 (list 3 
                       (list 1 null null)
                       null)
                 (list 9
                       (list 7 null null)
                       (list 11 null null))))
(tree->list-1 t3)
(tree->list-2 t3)

;; 1. two procedure output same results about t1, t2, t3.
;; 2. order of growth 
;; 'tree->list-1' : 
;; (1) continuous right until meet 'null', (2) and one left, append result of (1),
;; so order of growth : THETA(n^2) because of 'append'
;;
;; 'tree->list-2' : 
;; (1) continuous right until meet 'null', (2) and one left, and repeat (1)
;; so order of growth : THETA(n)
;; 