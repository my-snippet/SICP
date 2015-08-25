(load "../../modules/3/stream.ss")


(define ones (cons-stream 1 ones))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define integers (cons-stream 1 (add-streams ones integers)))


(define (partial-sums stream)
  (cons-stream (stream-car stream)
	       (add-streams (stream-cdr stream) (partial-sums stream))))


(define int-partial-streams (partial-sums integers))
(display-stream-range int-partial-streams 0 9)

;; (define double-integers (add-streams integers double-integers))

;; (display-stream-range double-integers 0 9)
;; (display-stream-range integers 0 9)
