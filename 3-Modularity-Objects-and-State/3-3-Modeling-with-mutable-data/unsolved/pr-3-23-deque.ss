(load "../../modules/3/put-get.ss")


;; How can I make a deque?
;; IDEA : triple set, FIRST : HEAD, SECOND : CONTENTS, THIRD : TAIL 
;; front-insert-deque!
;; rear-insert-deque!
;; front-delete-deque!
;; rear-delete-deque!


(define (make-deque)
  (list '() '() '()))

(define (front-ptr deque)
  (car deque))

(define (rear-ptr deque)
  (caddr deque))

(define (empty-deque? deque)
  (if (and (null? (cadr deque))
		   true
		   false))


  ;; Following implementation(front-insert-deque!) is Just Idea 
  (define (front-insert-deque! deque item)
	(let ((new-deque (cons item '() '())))
	  (cond ((empty-queue? deque)
			 (set-front-ptr! deque new-deque)
			 (set-rear-ptr! deque new-deque)
			 queue)
			(else
			 (set-cdr! (rear-ptr queue) new-deque)
			 (set-rear-ptr! queue new-deque)
			 queue))))
  
;;(define (rear-insert-deque! deque item)
(define dq1 (make-deque))
;;(empty-deque? dq1)
(front-deque dq1)
(rear-deque dq1)
;;(front-insert-deque! dq1 1)
