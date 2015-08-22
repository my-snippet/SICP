(load "../../../modules/3/stream.ss")


(define (stream-map proc . argstreams)
  (display-line argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
	      (cons proc (map stream-cdr argstreams))))))

(define ex-stream-00 (stream-enumerate-interval 0 10))
(define ex-stream-01 (stream-enumerate-interval (- 15) 5)))

(display-stream (stream-map + ex-stream-00 ex-stream-01))
