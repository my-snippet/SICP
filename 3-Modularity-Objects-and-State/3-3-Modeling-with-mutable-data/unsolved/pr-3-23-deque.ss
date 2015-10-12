;; How can I make a deque?

(define (make-deque)
  (cons '() '()))

(define (front-deque deque)
  (car deque))

(define (rear-deque deque)
  (cdr deque))

(define (empty-deque? deque)
  (if (and (null? (front-deque deque))
		   (null? (rear-deque deque)))
	  true
	  false))

(define (front-insert-deque! deque item)
  (set-car! deque item))

;;(define (rear-insert-deque! deque item)


(define dq1 (make-deque))
(empty-deque? dq1)
(front-insert-deque! dq1 1)
