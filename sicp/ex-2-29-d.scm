(load "ex-2-29.scm")


;; d. Using different constructos 
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
    (cons length structure))

(define (branch-structure b)
  (cdr b))

(define (right-branch m)
  (cdr m))

;; does not a branch have a mobile?
(define (last-branch? b)
  (not (structure-mobile? (branch-structure b))))

(define (mobile-eval op m f)
  (op (f (left-branch m))
	  (f (right-branch m))))

(define (branch-weight b)
  (if (last-branch? b)
	  (branch-structure b)
	  (total-weight (branch-structure b))))

(define (total-weight m)
  (mobile-eval + m branch-weight))
