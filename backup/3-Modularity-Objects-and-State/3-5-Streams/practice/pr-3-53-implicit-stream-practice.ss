(load "../../../modules/3/stream.ss")

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define s (cons-stream 1 (add-streams s s)))

					;(stream-ref s 0)
(define (display-stream-range proc start end)
  (if (>= start end)
      (display-line (stream-ref proc end))
      (begin
	(display-line (stream-ref proc start))
	(display-stream-range proc (+ start 1) end))))

;; (display-stream-range s 0 2)
(display-stream-range s 0 10)
