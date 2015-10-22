(load "../../modules/3/put-get.ss")


;; How can I make a deque?
;; IDEA : triple set, FIRST : HEAD, SECOND : CONTENTS, THIRD : TAIL 
;; front-insert-deque!
;; rear-insert-deque!
;; front-delete-deque!
;; rear-delete-deque!


(define (make-deque)
  (list '() '() '()))

(define (front-deque deque)
  (car deque))

(define (rear-deque deque)
  (caddr deque))

(define (empty-deque? deque)
  (if (and (null? (front-deque deque))
		   (null? (rear-deque deque)))
	  true
	  false))

(define (front-insert-deque! deque item)
  (set-car! deque item))

;;(define (rear-insert-deque! deque item)
(define dq1 (make-deque))
;;(empty-deque? dq1)
(front-deque dq1)
(rear-deque dq1)
;;(front-insert-deque! dq1 1)
