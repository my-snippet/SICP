(load "../../../modules/3/stream.ss")

(define ones (cons-stream 1 ones))


(define (add-streams s1 s2)
  (stream-map + s1 s2))


;; It start with 2 for factorials
(define integers (cons-stream 1 (add-streams ones integers)))


(define (mul-stream s1 s2)
  (stream-map * s1 s2))


(define factorials
  (cons-stream 1
	       (mul-stream (stream-cdr integers)
			   factorials)))
;; (stream-ref factorials 4)

(define (display-stream-range proc start end)
  (if (>= start end)
      (display-line (stream-ref proc end))
      (begin
	(display-line (stream-ref proc start))
	(display-stream-range proc (+ start 1) end))))
(display-stream-range factorials 0 10)


;; (define mul-stream-test (mul-stream integers integers))
;; (stream-ref mul-stream-test 2)
;; (define mul-stream-test-2 (mul-stream integers ))
;; (stream-ref mul-stream-test-2 1)



