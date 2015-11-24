;; (load "../../modules/3/stream.ss")
(load "../../modules/3/stream-advanced.ss")
(load "../../modules/1/prime.ss")

;; Produce the stream of pairs(i, j) satisfying following conditions : i + j is prime
;; IDEA
;; combine (lambda (x) (list x (stream-car s)) and (lambda (x) (list (stream-car s) x)

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave s2 (stream-cdr s1)))))


(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list x (stream-car s)))
		(stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))


(define int-pairs (pairs integers integers))
(display-stream-range int-pairs 0 100)
