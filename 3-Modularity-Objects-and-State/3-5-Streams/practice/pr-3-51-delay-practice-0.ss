(load "../../../modules/3/stream.ss")


(define (show x)
  (display-line x)
  x)

(define ex-stream-0 (stream-enumerate-interval 0 10))

					;((lambda (e) e) (stream-car ex-stream-0))
					;(stream-cdr ex-stream-0)
					;(stream-map (lambda (e) e) ex-stream-0)
					;(map (lambda (e) (+ e 1)) '(1 2 3)))
					;(display-stream ex-stream-0)
(define x
  (stream-for-each show
		   ex-stream-0))

(define x
  (stream-map show
	      ex-stream-0))


(stream-ref x 5)
(stream-ref x 7)
