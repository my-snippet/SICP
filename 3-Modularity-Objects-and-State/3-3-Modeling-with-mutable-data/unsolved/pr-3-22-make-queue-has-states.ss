(define (make-queue)
  (let ((front-ptr '())
  		(rear-ptr '()))

	(define (set-front-ptr! queue item) (set-car! queue item))
	(define (set-rear-ptr! queue item) (set-cdr! queue item))
	(define (insert-queue! queue item)
	  (let ((new-pair (cons item '())))
		(cond ((empty-queue? queue)
			   (set-front-ptr! queue new-pair)
			   (set-rear-ptr! queue new-pair)
			   queue)
			  (else
			   (set-cdr! (rear-ptr queue) new-pair)
			   (set-rear-ptr! queue new-pair)
			   queue))))	
	
	(define (dispatch m)
	  (cond ((eq? m 'front-ptr) front-ptr)
			((eq? m 'rear-ptr) rear-ptr)
			((eq? m 'insert-queue!) insert-queue!)
			
			(else "Unknown message")))
	dispatch))

(define a (make-queue))
(a 'front-ptr)
(a 'rear-ptr)
