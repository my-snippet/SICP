(load "../../modules/3/stream.ss")


(define ones (cons-stream 1 ones))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define integers (cons-stream 1 (add-streams ones integers)))


(define (partial-sums stream)
  (cons-stream stream
	       (add-streams stream
			    integers)))

(define int-partial-streams (partial-sums integers))
(stream-ref int-partial-streams 1)
