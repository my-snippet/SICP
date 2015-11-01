;; referenced by https://wqzhang.wordpress.com/2009/07/19/sicp-exercise-3-23/

;; *Notice
;; - To avoid infinite recursive, No access directly, Use custom print procedure
;; Use TDD

;; -> arrow means "set-...!"
;; 1. New item (rear & front same)
;;   I_0 = ((i0) ())
;;   D = (d0 d1)
;;   d0, d1 -> I_0

;; Rear Insert
;; 2. Add item
;; 2-1. Point Prev node from Next node
;;   I_1 = ((i1) ())
;;   (cdr I_1) -> (cdr D)
;; 2-2. Point Next node from Prev Node
;;   (cddr D)) -> I_1
;; 2-3. Point Tail Node
;; (cdr D) -> (I_1)


(load "../../modules/testing.scm")
(load "../../modules/2/list-operation.ss")

(define (is-same-lists l1 l2)
  ;; are l1 & l2 same lists? (pre-requisites : 1-dimension, same length)
  (cond ((and (null? l1) (null? l2))
		 true)
		((and (number? l1) (number? l2))
		 (= l1 l2))
		(else
		 (if (not (= (car l1) (car l2)))
			 false
			 (is-same-lists (cdr l1) (cdr l2))))))

(define (make-deque)
  (cons '() '()))

(define (empty-deque? deque)
  (null? (car deque)))

(define (rear-insert-deque! deque item)
  (let ((new-deque (cons item (cons '() '()))))
	(cond ((empty-deque? deque)
		   (set-car! deque new-deque)
		   (set-cdr! deque new-deque))
		  (else
		   (display "not yet"))))))

(define (print-deque deque)
  (car deque))


;; Initialize and give a name to a simple testsuite.
(test-begin "test-deque")

(define dq0 (make-deque))
(define dq1 (rear-insert-deque! (make-deque) 1))
(define elem0 'a)

(define (test-make-deque-consist-of-null deque)
  ;; empty deque consists of the empty(null) pair
  (test-assert (and (null? (car deque))
					(null? (cdr deque)))))
(test-make-deque-consist-of-null dq0)

(define (test-rear-insert-deque! deque)
  (define (insert!-when-empty element)
	;; When you insert an element in an empty deque,
 	;; it should be added inside the deque
	;; the shape is ([element] ('() '()))
	;;(test-assert true))
	(rear-insert-deque! deque element)	
	(test-assert (eq? element (caar deque))))
  (insert!-when-empty elem0))
(test-rear-insert-deque! dq0)

(define (test-empty-deque-contains-nothing deque)
  (test-assert (empty-deque? deque)))
(test-empty-deque-contains-nothing (make-deque))

(define (test-is-same-lists)
  (define l1 (cons 1 2))
  (define l2 (cons 3 4))
  (test-assert (not (is-same-lists l1 l2)))
  (test-assert (is-same-lists l1 l1)))
(test-is-same-lists)

(define (test-print-deque deque)
  (test-assert (is-same-lists (car deque) (print-deque deque))))
(define deque-for-print (cons (list 1 2 3 4) (cons '() '())))
(test-print-deque deque-for-print)

(test-end "test-deque")
