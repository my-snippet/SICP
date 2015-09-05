(load "../../modules/3/stream-advanced.ss")
;; (load "infinite-stream-of-pairs.ss")


;; Description
;; If S <= T <= U, it can be divided into 2 cases
;; 1. Fix S, T and Increase U
;; 2. Fix S, and Increase T, U equally

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


(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (interleave
     
     ;; Fix s, t. Up u
     (stream-map (lambda (x) (list (stream-car s) (stream-car t) x))
		 (stream-cdr u))
     
     ;; Fix s. Up t, u equally
     (stream-map (lambda (x y) (list (stream-car s) x y))
		 (stream-cdr t) (stream-cdr u)))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

;;(let ((values (stream-car (pairs s t))))
;; (append values (cons (stream-car u)))))

;;  (interleave
;;  (stream-map (lambda (x y) (list (stream-car s) x y))
;;		(stream-cdr t)

(define s0 (triples integers integers integers))
;; s0
;; (triples integers integers integers)
;; (display-stream-range s0 0 100)
