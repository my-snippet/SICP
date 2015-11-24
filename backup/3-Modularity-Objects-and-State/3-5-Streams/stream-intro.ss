(load "../../modules/1/prime.ss")

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))
(Stream-ref stream-ex-1 1)


(define stream-ex-0 (cons-stream 1 2))
(define stream-ex-1 (cons-stream 1 (cons-stream 2 (cons-stream 3 0))))
(stream-car stream-ex-0)
(stream-cdr stream-ex-0)


(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
	     (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))
					;(display-stream stream-ex-1)


(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))


(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
	((pred (stream-car stream))
	 (cons-stream (stream-car stream)
		      (stream-filter
		       pred
		       (stream-cdr stream))))
	(else (stream-filter pred (stream-cdr stream)))))

(stream-car
 (stream-cdr
  (stream-filter prime?
		 (stream-enumerate-interval
		  10000 1000000))))


;; Delay & Force
(define (force delayed-object)
  (delayed-object))

(define (memo-proc proc)
  (let ((already-run? false) (result false))
    (if (not already-run?)
	(begin (set! result (proc))
	       (set! already-run? true)
	       result))))

(define (delay proc)
  (memo-proc (lambda () proc)))
(force (delay (lambda () (display "delayed"))))
