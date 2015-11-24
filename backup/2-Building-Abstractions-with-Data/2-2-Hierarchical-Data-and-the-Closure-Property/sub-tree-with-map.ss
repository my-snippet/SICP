#lang racket

(define tree1 (list (list 1 2) (list 3 4)))

;; Apply all the leaves
(define (scale-tree tree factor)
  (if (null? tree)
      null
      (if (not (pair? tree))
          (* tree factor)
          (cons (scale-tree (car tree) factor)
                (scale-tree (cdr tree) factor)))))


;; Apply map to the tree as a sequence of sub-tree
(define (scale-tree-using-map tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree-using-map sub-tree factor)
             (* sub-tree factor)))
       tree))

;(map (lambda (x) (* x x)) (list 3 5))
(scale-tree tree1 10)
(scale-tree-using-map tree1 10)