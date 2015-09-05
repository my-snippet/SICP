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


(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    ;;    (interleave
    
    ;; Fix s, t. Up u
    ;;     (stream-map (lambda (x) (list (stream-car s) (stream-car t) x))
    ;;		 (stream-cdr u))

    (let ((pairs (stream-map (lambda (x) (list (stream-car s) x))
			     (stream-cdr t))))
      (let (pair (stream-car pairs))
	(stream-map (lambda (y)
		      
		    (stream-cdr u))
    
    ;; Fix s. Up t, u equally
    ;;  (stream-map (lambda (x y) (list (stream-car s) x y))
    ;;		(stream-cdr t) (stream-cdr u)))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

;;(let ((values (stream-car (pairs s t))))
;; (append values (cons (stream-car u)))))

;;  (interleave
;;  (stream-map (lambda (x y) (list (stream-car s) x y))
;;		(stream-cdr t)
(define (pythagorean-triples? a b c)
  (= (+ (square a) (square b)) (square c)))

;;(define (pythagorean-triples)
(define (inner triples)
  (let ((triple (stream-car triples)))
    (display triple)
    (newline)
    (let ((a (car triple))
	  (b (cadr triple))
	  (c (caddr triple)))
      (if (pythagorean-triples? a b c)
	  (cons-stream triple
		       (inner (stream-cdr triples)))
	  (inner (stream-cdr triples))))))

;;  (triples integers integers integers))
;; (let ((triple-values (triples integers integers integers)))
;;  triple-values
;;(display triple-values)
;; ))


(define s0 (triples integers integers integers))
;;(stream-car (inner s0))
(display-stream-range s0 0 1000)
;;(display-stream-range pythagorean-triples 0 0)
