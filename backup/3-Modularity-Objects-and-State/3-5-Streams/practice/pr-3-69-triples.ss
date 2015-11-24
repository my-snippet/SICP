;; (load "../../modules/3/stream-advanced.ss")
(load "infinite-stream-of-pairs.ss")

;; Reference : https://github.com/jaroslawr/sicp/blob/master/3-69-triples.scm

;; Description
;; If S <= T <= U, it can be divided into 3 cases
;; 1. Fix S, T and Increase U
;; 2. Fix S, and Increase T, U equally
;; 3. Increase S, T, U equally
;;
;; In other words,
;; 1. S = T = U can be made using (cons-stream (stream-car s) (stream-car t) (stream-car u)) 
;; 2. T < U in S <= T < U can be made using (pairs t (stream-cdr u))


(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (stream-map (lambda (x) (append (list (stream-car s)) x))
		(pairs t (stream-cdr u)))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

;;(let ((values (stream-car (pairs s t))))
;; (append values (cons (stream-car u)))))

;;  (interleave
;;  (stream-map (lambda (x y) (list (stream-car s) x y))
;;		(stream-cdr t)
(define (pythagorean-triples? a b c)
  (= (+ (square a) (square b)) (square c)))


(define (pythagorean-triples)
  (define (inner triples)
    (let ((triple (stream-car triples)))
      (let ((a (car triple))
	    (b (cadr triple))
	    (c (caddr triple)))
	(if (pythagorean-triples? a b c)
	    (cons-stream triple
			 (inner (stream-cdr triples)))
	    (inner (stream-cdr triples))))))
  (let ((triple-values (triples integers integers integers)))
    (inner triple-values)))


;;(define s0 (triples integers integers integers))
;; (display-stream-range s0 0 100)
;; (pythagorean-triples)
;; (display-stream-range (pythagorean-triples) 0 5)
;;(display-stream-range (inner s0) 0 5)
