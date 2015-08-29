(load "../../modules/3/stream-paradigm.ss")


(define (ln-2-summands n)
  (cons-stream (/ 1.0 n)
	       (stream-map - (ln-2-summands (+ n 1)))))


(define ln-2-stream
  (partial-sums (ln-2-summands 1)))
;; (stream-cdr (stream-cdr (ln-2)))
(display-stream-range ln-2-stream 0 10)
(display-stream-range (euler-transform ln-2-stream) 0 10)
(display-stream-range (accelerated-sequence euler-transform ln-2-stream) 0 10)
