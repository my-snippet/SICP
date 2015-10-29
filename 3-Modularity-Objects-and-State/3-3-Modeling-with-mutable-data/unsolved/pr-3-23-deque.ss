;; front-insert-deque!
;; rear-insert-deque!
;; front-delete-deque!
;; rear-delete-deque!

;; *Notice : (cdr (make-queue)) points (item '()). Therefore (set-cdr! (cdr a-queue)) changes (cdr item '())

;; Most of implementation is equal to 'queue', So it can be implemented just by calling
;; correspond procedures, ex : (define (make-deque) (make-queue)) Or just load library

;; idea 1 : no need a proxy, just cdr deque points second from last element
;; in that way, the position of last element is located (cdr (cdr deque))


;; idea 0
;; To delete from rear side, It requires previous item position
;; Therefore, it should be needed to add a proxy, approach prev item position
;; rear-deque points the proxy, (car proxy) points last item, (cdr proxy) points previous last item
(load "queue.ss")


(define (make-deque) (make-queue))
(define (empty-deque? deque) (empty-queue? deque))
(define (front-deque deque) (front-ptr deque))
(define (rear-deque deque) (if (null? (cdr deque))
							   deque
							   (cdr deque)))
(define (set-front-deque! deque item) (set-front-ptr! deque item))
(define (set-rear-deque! deque item) (set-rear-ptr! deque item))

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons item '())))
	(cond ((empty-deque? deque)
		   (set-front-deque! deque new-pair)
		   (set-rear-deque! deque new-pair)
		   deque)
		  (else
		   (display (cdr (cdr deque)))
		   (display (cdr deque))
		   (set-cdr! (rear-deque deque) new-pair)
		   (display (cdr deque))
		   (if (not (null? (cdr deque)))
			   (set-rear-deque! deque (cdr deque))
			   deque)
		   deque))))

(define (front-delete-deque! deque)
  (delete-queue! deque))

;;(define (front-insert-deque! deque item)


;;(define (rear-delete-deque! deque item)

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
		 (error "Empty"))
		(else
		 (set-front-ptr! queue (cdr (front-ptr queue)))
		 queue)))

;;(define (rear-insert-deque! deque item)

(define dq1 (make-deque))
(empty-deque? dq1)
;;(front-deque dq1)
;;(rear-deque dq1)
(rear-insert-deque! dq1 1)
(rear-insert-deque! dq1 2)
(rear-insert-deque! dq1 2)

;;(cdr (cons 1 '()))
;;(rear-delete-deque! dq1)
;;(front-insert-deque! dq1 3)
;;(define a (list 1 2 3))
;;(set-cdr! a (cons 4 '()))
;;a

;;(set-rear-deque! dq1 (front-deque dq1))
;;(define a (cons 1 '()))
;;(set-cdr! a (car dq1))
;;a
;;(front-insert-deque! dq1 3)
;; set-cdr! change the cdr of op1 to the car of op2 
;;(define test-set-cdr (cons 1 2))
;;(set-cdr! test-set-cdr (cons 3 4))
;;test-set-cdr
