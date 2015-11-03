;; *Notice : (cdr (make-queue)) points (item '()). Therefore (set-cdr! (cdr a-queue)) changes (cdr item '())
;; *Caution : car, cdr, ... : content in box, set-...! : pointer from box


;; *Don't modify basic modules as much as possible !! ( remind the purpose of the module )

;; idea 4 : prev node(pair) is essential for rear-delete !
;; because, it is required to point prev node after delete.
;; -> But it's too complex + infinite recursion problem occur

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


(define (make-deque) (cons '() '()))
(define (empty-deque? deque) (null? (car deque)))
(define (front-deque deque) (car deque))
(define (rear-deque deque) (cdr deque))
(define (set-front-deque! deque item) (set-car! deque item))
(define (set-rear-deque! deque item) (set-cdr! deque item))

(define (front-insert-deque! deque item)
  (let ((new-pair (cons item '())))
	(cond ((empty-deque? deque)
		   (set-front-deque! deque new-pair)		   
		   (set-rear-deque! deque new-pair)
		   deque)
		  (else
		   (let ((new-front-deque (set-cdr! new-pair (car deque))))
			 (set-front-deque! deque new-pair)
			 deque)))))

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons item '())))
	(cond ((empty-deque? deque)
		   (set-front-deque! deque new-pair)		   
		   (set-rear-deque! deque new-pair)
		   deque)
		  (else
		   (set-cdr! (rear-deque deque) new-pair)
		   (set-rear-deque! deque new-pair)
		   deque))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
		 (error "Empty"))
		(else
		 (set-car! deque (cdr (front-deque deque)))
		 deque)))
  
(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
		 (error "Empty"))
		(else
		 (set-cdr! (cadr deque) '())
		 ;;		 (set-car! (cdr deque) (
		 (set-rear-deque! deque (cadr deque))
		 deque)))

;;(define (rear-insert-deque! deque item)

(define dq1 (make-deque))
;;(empty-deque? dq1)
;;(front-deque dq1)
;;(rear-deque dq1)
(rear-insert-deque! dq1 1)
(rear-insert-deque! dq1 2)
(rear-insert-deque! dq1 3)
(rear-insert-deque! dq1 4)
(front-insert-deque! dq1 (- 1))
(front-delete-deque! dq1)

;;(rear-delete-deque! dq1)

;;(set-car! (cdr dq1) '())
;;dq1

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
