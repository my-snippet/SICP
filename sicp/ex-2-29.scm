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

;; This has some errors
;; 1. it did not use provided modules.
;; 2. it addded the lengths, not weights
;; (define (total-weight m)
;;   (cond ((null? m) 0)
;; 		((not (pair? m)) m)
;; 		((not (pair? (cadr m))) (car m))
;; 		(else (+ (total-weight (car m))
;; 				 (total-weight (cadr m))))))

;; does a branch last?
(define (last-branch? b)
  (number? (branch-structure b)))

;; does a branch contain mobile?
(define (contain-mobile? b)
  (and (pair? (branch-structure b))
	   (pair? (left-branch (branch-structure b)))))

(define (branch-weight b)
  (display b)
  (newline)
  (cond ((not (pair? b)) b)
		((contain-mobile? b) (total-weight (branch-structure b)))
;;		((last-branch? b) (branch-structure b))
		(else (branch-weight (branch-structure b)))))

(define (total-weight m)
  (+ (branch-weight (left-branch m))
	 (branch-weight (right-branch m))))


(define (make-mobile-cons left right)
  (cons left right))

(define (make-branch-cons length structure)
    (cons length structure))
