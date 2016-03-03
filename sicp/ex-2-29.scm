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
  (not (pair? (branch-structure b))))

;; does a branch contain mobile?
(define (contain-mobile? b)
  (pair? (branch-structure b)))

(define (branch-weight b)
  (if (last-branch? b)
	  (branch-structure b)
	  (total-weight (branch-structure b))))

(define (total-weight m)
  (+ (branch-weight (left-branch m))
	 (branch-weight (right-branch m))))

;; Avoid the direction problem in the mobile using that the torque
;; procedure does not allow a branch that has mobile below it.
(define (torque b)
  (if (pair? (branch-weight b))
	  (error "Only one level depth branch possible.")
	  (* (branch-length b) (branch-weight b))))

;;(define (balanced? m)
;;  (= (torque (left-branch m))
		


(define (make-mobile-cons left right)
  (cons left right))

(define (make-branch-cons length structure)
    (cons length structure))
