(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (??
       (apply proc (map ?? argstreams))
       (apply stream-map
	      (cons proc (map ?? argstreams))))))
