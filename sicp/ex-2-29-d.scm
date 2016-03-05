(load "ex-2-29.scm")


;; d. Using different constructos
;; Just 4 procedures should be modified.
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (branch-structure b)
  (cdr b))

(define (right-branch m)
  (cdr m))
