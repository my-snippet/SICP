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

;;(define (test-make-deque)
;;  ((make-deque))

(define (make-deque)
  (cons '() '()))



(define (test-deque)
  (define dq0 (make-deque))
  
  (define (test-make-deque-consist-of-null deque)
	(if (and (null? (car deque))
			 (null? (cdr deque)))
		true
		(error "test-make-deque should consist-of-null")))
  (test-make-deque-consist-of-null dq0)

  ;;  (define (test-rear-insert-deque!-contents)
  )
(test-deque)
