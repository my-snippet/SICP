(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (cadr m))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (cadr b))
 
(define (total-weight m)
  (cond ((null? m) 0)
		((not (pair? m)) m)
		((not (pair? (cadr m))) (car m))
		(else (+ (total-weight (car m))
				 (total-weight (cadr m))))))

(define (make-mobile-cons left right)
  (cons left right))

(define (make-branch-cons length structure)
    (cons length structure))