;; How can I make a deque?
;; IDEA 0 : triple set, FIRST : HEAD, SECOND : CONTENTS, THIRD : TAIL
;; <- But it seems to be not needed. Already I know HEAD & TAIL
;; front-insert-deque!
;; rear-insert-deque!
;; front-delete-deque!
;; rear-delete-deque!

;; Most of implementation is equal to 'queue', So it can be implemented just by calling
;; correspond procedures, ex : (define (make-deque) (make-queue))
(define (make-deque) (cons '() '()))
(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))
(define (empty-deque? deque) (null? (car deque)))
(define (set-front-deque! deque item) 

(define (front-insert-deque! deque item)
  (let ((new-deque (cons item '())))
	(cond ((empty-queue? deque)
		   (set-front-ptr! deque new-pair)
		   (set-rear-ptr! deque new-pair)
		   queue)
		  (else
		   (set-cdr! (rear-ptr deque) new-pair)
		   (set-rear-ptr! deque new-pair)
		   deque))))
  
;;(define (rear-insert-deque! deque item)
;;(define dq1 (make-deque))
;;(empty-deque? dq1)
;;(front-deque dq1)
;;(rear-deque dq1)
;;(front-insert-deque! dq1 1)


;; set-cdr! change the cdr of op1 to the car of op2 
;;(define test-set-cdr (cons 1 2))
;;(set-cdr! test-set-cdr (cons 3 4))
;;test-set-cdr
