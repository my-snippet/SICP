;; *Notice : (cdr (make-queue)) points (item '()). Therefore (set-cdr! (cdr a-queue)) changes (cdr item '())

;; idea 3 : size 3 list. car : CONTENTS, cadr : PREV, caddr : TAIL
;; cadr is only for delete-rear-deque!

;; idea 1 : no need a proxy, just cdr deque points second from last element
;; in that way, the position of last element is located (cdr (cdr deque))


;; idea 0
;; To delete from rear side, It requires previous item position
;; Therefore, it should be needed to add a proxy, approach prev item position
;; rear-deque points the proxy, (car proxy) points last item, (cdr proxy) points previous last item

;;;;;;;;;;;;;;;;;
;; Deprecated 
;; Most of implementation is equal to 'queue', So it can be implemented just by calling
;; correspond procedures, ex : (define (make-deque) (make-queue)) Or just load library
;;;;;;;;;;;;;;;;;


(define (make-deque) (list '() '() '()))
(define (empty-deque? deque) (null? (car deque)))
(define (front-deque deque) (car deque))
;;(define (prev-deque deque) (cadr deque))
(define (rear-deque deque) (cddr deque))
(define (set-front-deque! deque item) (set-car! deque item))
(define (set-rear-deque! deque item) (set-cdr! deque item))

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons item '())))
	(cond ((empty-deque? deque)
		   (set-car! deque new-pair)		   
		   (set-cdr! (cdr deque) new-pair)
		   deque)
		  (else
		   ;;(display (cdr deque))
		   ;;(set-car! (cdr deque) (cddr deque))
		   (set-cdr! (rear-deque deque) new-pair)
		   (set-cdr! (cdr deque) new-pair)
		   deque))))

;;(define (front-delete-deque! deque)
;;  (delete-queue! deque))

;;(define (front-insert-deque! deque item)
(define (rear-delete-deque! deque item)
  (cond ((empty-deque? queue)
		 (error "Empty"))
		(else
		 (set-rear-deque (cdr (prev-deque queue)) '())
		 queue)))

;;(define (rear-insert-deque! deque item)

(define dq1 (make-deque))
;;(empty-deque? dq1)
;;(front-deque dq1)
;;(rear-deque dq1)
(rear-insert-deque! dq1 1)
(rear-insert-deque! dq1 2)
(rear-insert-deque! dq1 3)
(rear-insert-deque! dq1 4)

;;(set-car! (cdr dq1) '())
dq1

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
