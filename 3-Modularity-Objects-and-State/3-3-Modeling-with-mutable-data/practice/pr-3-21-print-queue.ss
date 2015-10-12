(load "../queue.ss")


(define q1 (make-queue))
(insert-queue! q1 'a)
(insert-queue! q1 'b)
(delete-queue! q1)
(delete-queue! q1)

(define (print-queue queue)
  (if (null? (car queue))
	  (error "Empty")
	  (car queue)))
(define q2 (make-queue))
(insert-queue! q2 'a)
(insert-queue! q2 'b)
(print-queue q2)
(delete-queue! q2)
(print-queue q2)
