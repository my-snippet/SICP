;; (load "../../modules/3/stream.ss")
(load "../../modules/3/stream-advanced.ss")
(load "../../modules/1/prime.ss")

;; Produce the stream of pairs(i, j) satisfying following conditions : i + j is prime, i <= j
;; IDEA
;;(stream-filter (lamda (pair)
;;		      (prime? (+ (car pair) (cadr pair))))
;;	       int-pairs)
;; Make " int-pairs " 


(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave s2 (stream-cdr s1)))))


(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))


;;(define s1 integers)
;;(display-stream-range s1 0 10)
;;(define s2 integers)
;;(display-stream-range (pairs s1 s2) 0 10)
(define int-pairs (pairs integers integers))
(define prime-sum-stream
  (stream-filter (lambda (pair)
		   (prime? (+ (car pair) (cadr pair))))
		 int-pairs))
;;prime-sum-stream
;;(display-stream-range prime-sum-stream 0 100)
