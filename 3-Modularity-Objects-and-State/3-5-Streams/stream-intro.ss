(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))



(define stream-ex-0 (cons-stream 1 2))
(define stream-ex-1 (cons-stream 1 (cons-stream 2 3)))

(stream-car stream-ex-0)
(stream-cdr stream-ex-0)

(Stream-ref stream-ex-1 3)