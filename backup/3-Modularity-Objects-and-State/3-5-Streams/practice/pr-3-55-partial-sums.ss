(load "../../modules/3/stream.ss")


;; Description
;; If a stream enumuerates like this : s0, s0 + s1, s0 + s1 +s2, ...
;; It can simplify like this : r0, r1, r2,  ... (r = n th result)
;; And this is contained like this : (r0, r1, r2, ..., promise) = (s0, s0 + s1, s0 + s1 + s2, ..., promise)
(define ones (cons-stream 1 ones))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define integers (cons-stream 1 (add-streams ones integers)))


(define (partial-sums stream)
  (define inner
    (cons-stream (stream-car stream)
		 (add-streams (stream-cdr stream) inner)))
  inner)


(define int-partial-streams (partial-sums integers))
(display-stream-range int-partial-streams 0 9)

;; (define double-integers (add-streams integers double-integers))

;; (display-stream-range double-integers 0 9)
;; (display-stream-range integers 0 9)
