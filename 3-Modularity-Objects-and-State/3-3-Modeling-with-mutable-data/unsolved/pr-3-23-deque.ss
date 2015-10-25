;; How can I make a deque?
;; IDEA 0 : triple set, FIRST : HEAD, SECOND : CONTENTS, THIRD : TAIL
;; <- But it seems to be not needed. Already I know HEAD & TAIL
;; front-insert-deque!
;; rear-insert-deque!
;; front-delete-deque!
;; rear-delete-deque!

;; *Notice : (cdr (make-queue)) points (item '()). Therefore (set-cdr! (cdr a-queue)) changes (cdr item '())

;; Most of implementation is equal to 'queue', So it can be implemented just by calling
;; correspond procedures, ex : (define (make-deque) (make-queue)) Or just load library
(load "queue.ss")


(define (make-deque) (make-queue))
(define (empty-deque? deque) (empty-queue? deque))
(define (front-deque deque) (front-ptr deque))
(define (rear-deque deque) (rear-ptr deque))
(define (set-front-deque! deque item) (set-front-ptr! deque item))
(define (set-rear-deque! deque item) (set-rear-ptr! deque item))


(define (front-insert-deque! deque item)
  (let ((new-pair (cons item '())))
	(cond ((empty-deque? deque)
		   (set-front-deque! deque new-pair)
		   (set-rear-deque! deque new-pair)
		   deque)
		  (else
		   (set-cdr! (rear-deque deque) new-pair)
		   (set-rear-deque! deque new-pair)
		   deque))))

;;(define (rear-insert-deque! deque item)

(define dq1 (make-deque))
(empty-deque? dq1)
(front-deque dq1)
(rear-deque dq1)
(front-insert-deque! dq1 1)
(front-insert-deque! dq1 2)


;; set-cdr! change the cdr of op1 to the car of op2 
;;(define test-set-cdr (cons 1 2))
;;(set-cdr! test-set-cdr (cons 3 4))
;;test-set-cdr
