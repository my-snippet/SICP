;; referenced by https://wqzhang.wordpress.com/2009/07/19/sicp-exercise-3-23/

;; *Notice
;; - To avoid infinite recursive, No access directly, Use custom print procedure
;; Use TDD

;; -> arrow means "set-...!"
;; 1. New item (rear & front same)
;;   I_0 = ((i0) ())
;;   D = (d0 d1)
;;   d0, d1 -> I_0

;; Deque Structure : ([ITEMs] ([SECOND] [SECOND LAST])

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
  (let ((new-node (cons item (cons '() '()))))
	(cond ((empty-deque? deque)
		   (set-car! deque new-node)
		   (set-cdr! deque new-node))
		  (else
		   (set-car! (cdr new-node) (cdr deque))
		   (set-cdr! (cddr deque) new-node)
		   (set-cdr! deque new-node)))))

(define (extract-deque-elements deque)
  ;; 1. After inserting first item, shape is : (([item 0] ()) [item 0] ())
  ;; * Notice : First cons makes () to car
  ;; 2. And Second item, shape is : (([item 0] (() (NEXT NODE))) () (NEXT NODE))
  ;; At this point, A little confusing happen -> To extract item in the first deque need the [caar]
  ;; But after that, just need the [car].
  (define (_extract-deque-elements deque0)
	(if (null? deque0)
		'()
		(cons (car deque0)
			  (_extract-deque-elements (cddr deque0)))))
  (_extract-deque-elements (car deque)))

(define (print-deque deque)
  (display (extract-deque-elements deque)))

(define (continuous-rear-insert! deque list0)
  (apply rear-insert-deque! list0))
;;(continuous-rear-insert! (make-deque) (list 1 2 3))

;; Initialize and give a name to a simple testsuite.
(test-begin "test-deque")

(define (test-make-deque-consist-of-null deque)
  ;; empty deque consists of the empty(null) pair
  (test-assert (and (null? (car deque))
					(null? (cdr deque)))))
(test-make-deque-consist-of-null (make-deque))

(define (test-rear-insert!-when-empty deque element)
  ;; When you insert an element in an empty deque,
  ;; it should be added inside the deque
  ;; the shape is ([element] ('() '()))
  ;;(test-assert true))
  (rear-insert-deque! deque element)
  (test-assert (eq? element (caar deque))))
(test-rear-insert!-when-empty (make-deque) 'a)

(define (test-rear-insert!-when-not-empty deque)
  ;; 1. insert item 0, item 1 into the deque
  ;; 2. first node should have the second node(next node) : (cddr deque)
  ;; 2-1. second node should have a item 1
  ;; 3. second node should have the first node(prev node) : (caddr deque)
  ;; 3-1 . first node should have a item 0
  (test-assert (and (= 1 (cadr deque))
					(= 0 (car (caddr deque))))))
(define test-dq0 (make-deque))
(rear-insert-deque! test-dq0 0)
(rear-insert-deque! test-dq0 1)
;; (cadr test-dq0) = 1(second node value)
;;(caar (caddr test-dq0)) = 0(first node value)
(test-rear-insert!-when-not-empty test-dq0)

(define (test-empty-deque-contains-nothing deque)
  (test-assert (empty-deque? deque)))
(test-empty-deque-contains-nothing (make-deque))

(define (test-is-same-lists)
  (define l1 (cons 1 2))
  (define l2 (cons 3 4))
  (test-assert (not (is-same-lists l1 l2)))
  (test-assert (is-same-lists l1 l1)))
(test-is-same-lists)

(define (test-extract-deque-elements deque)
  (define test-list0 (list 1 2 3 4))
  (test-assert (is-same-lists test-list0 (extract-deque-elements deque))))

(define test-dq1 (make-deque))
(rear-insert-deque! test-dq1 1)
(rear-insert-deque! test-dq1 2)
(rear-insert-deque! test-dq1 3)
(rear-insert-deque! test-dq1 4)
(test-extract-deque-elements test-dq1)

(test-end "test-deque")
(extract-deque-elements test-dq1)
;;(print-deque test-dq1)
;;test-dq1
;;(cadr (car test-dq1)))
;;(caar test-dq1)
