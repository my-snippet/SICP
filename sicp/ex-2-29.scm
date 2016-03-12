;; Naming problems.
;; If a procedure evaluates whether does the structure of a branch
;; contain structure or not, then what is a suitable name for the
;; procedure?
;; 1. explicitly
;; 2. reducing
;; Example
;; -> does-the-structure-of-a-branch-contain-structure-or-not?
;; -> does-structure-contain-structure?
;; -> contain-structure?

;; Cross references.
;; 1. balanced & branch-balanced 
;; 2. total-weight & branch-weight
;; I think these cases can be a seperated functions(procedures),
;; not a multiple function. Because branches also can have a mobile 
;; likewise mobile have branches.

;; About Lengths and Weights
;; * Only weights have a weight, not lengths of branches.

;; About direction problems
;; I assume that each branches of all the mobile is the half opposite
;; direction. Then it(direction) does not act on the torque of the
;; above branches,
;; But, if the length of two branches are different, the torque of the
;; above branches will be different.
;; To escape this problem, it assumes a branch is forced by 
;; the below weights directly(100%) regardless of direction problems,
;; that is, branch torque can be calculated by the lenght of the branch
;; and the below weights.
;; * However, to save the minimum safty of the mobile, I think it
;; should be checked from the lowest level of the mobiles to the highest.
;; I mean if the below two branches are balanced, then the upper branch
;; can ignore direction problems.

;; + Exclusion
;; And it is hart to compare each same levels of branch torque because it
;; uses the recursive process. Therefore here the balanced? checks only
;; per one mobiles, not all the same levels of that.


(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m)
  (car m))

;; A list has null to the last index. therefore if one element is left,
;; it will returns a pair.
(define (right-branch m)
  (cadr m))

(define (branch-length b)
  (car b))

;; if a branch has a mobile as structure
;; 'cdr' returns 2 level-enclosed lists. (( m ))
;; and if it has just a weight,
;; 'cdr' returns a value that is not enclosed.
(define (branch-structure b)
  (let ((structure (cdr b)))
	(if (not (pair? structure))
		structure
		(car structure))))

;; This has some errors
;; 1. it did not use provided modules.
;; 2. it added the lengths, not weights
;; (define (total-weight m)
;;   (cond ((null? m) 0)
;; 		((not (pair? m)) m)
;; 		((not (pair? (cadr m))) (car m))
;; 		(else (+ (total-weight (car m))
;; 				 (total-weight (cadr m))))))

;; does-a-structure-of-a-branch-contain-mobile-or-not?
(define (structure-mobile? structure)
  (pair? structure))
   
;; does a branch contain mobile?
(define (contain-mobile? b)
  (structure-mobile? (branch-structure b)))

;; does not a branch have a mobile?
(define (last-branch? b)
  (not (contain-mobile? b)))

;; mobile-eval
;; it evaluates the both sides of a mobile using a passed operations and
;; functions(procedure)
(define (mobile-eval op m f)
  (op (f (left-branch m))
	  (f (right-branch m))))

(define (branch-weight b)
  (if (last-branch? b)
	  (branch-structure b)
	  (total-weight (branch-structure b))))

;; unmoduling(?)
;;(define (total-weight m)
;;  (+ (branch-weight (left-branch m))
;;	 (branch-weight (right-branch m))))

(define (total-weight m)
  (mobile-eval + m branch-weight))

(define (branch-torque b)
  (* (branch-length b) (branch-weight b)))

(define (mobile-balanced? m)
  (mobile-eval = m branch-torque))

;; when it meets last branch, then return true because
;; last operation will be evaluated in 'balanced?'
(define (balanced? m)
  (define (_balanced? b)
	(if (last-branch? b)
		true
		(balanced? (branch-structure b))))
  (and (mobile-eval	(lambda (l r) (and l r)) m _balanced?)
	   (mobile-balanced? m)))
