(load "infinite-stream-of-pairs.ss")


;; IDEA
;; Give an initial value because it will be locked in infinite loop without it.
;; (cons-stream FIRST-COMPARED( i and j(=i+1) )
;; (interleave
;;  SECOND-COMPARED( i and j+1(=i+2) )
;;  (RECURSIVE-RAMANUJAN-CALL(i+1, j+1))


;; (display-stream-range (pairs integers integers) 0 10)
(define (cube x)
  (* x (square x)))


(define (stream-of-cube s)
  (if (stream-null? s)
      the-empty-stream
      (let ((value-of-cube (cube (stream-car s))))
	(cons-stream value-of-cube
		     (stream-of-cube (stream-cdr s))))))


(define integers-of-cube
  (stream-of-cube integers))


(define pairs-of-triple-numbers
  (pairs integers-of-cube integers-of-cube))
;; (display-stream-range pairs-of-triple-numbers 0 10)


(define (stream-of-sum-of-each-pair s)
  (let ((stream-value (stream-car s)))
    (cons-stream (+ (car stream-value) (cadr stream-value))
		 (stream-of-sum-of-each-pair (stream-cdr s)))))
;; (display-stream-range (stream-of-sum-of-each-pair pairs-of-triple-numbers) 0 10)
(define stream-of-sum-of-each-triple-numbers (stream-of-sum-of-each-pair pairs-of-triple-numbers))

(define (stream-of-ramanujan-numbers?)
  (define (iter stream-op1 stream-op2)
    (display (stream-car stream-op1))
    ;;
    (display ", ")
    (display (stream-car stream-op2))
    
    (newline)
    ;;
    (cons-stream (= (stream-car stream-op1) (stream-car stream-op2))
		 (interleave (stream-map (lambda (x) (= (stream-car stream-op1) x))
					 (stream-cdr stream-op2))
			     (iter (stream-cdr stream-op1) (stream-cdr stream-op2)))))
  (iter stream-of-sum-of-each-triple-numbers
	(stream-cdr stream-of-sum-of-each-triple-numbers)))
(display-stream-range (stream-of-ramanujan-numbers?) 0 1000)

(define (stream-of-ramanujan-numbers)
  (define (iter stream-of-ramanujan)
    (if (number? (stream-car stream-of-ramanujan))
	(cons-stream (stream-car stream-of-ramanujan)
		     (iter (stream-cdr stream-of-ramanujan)))))
  (iter (stream-of-ramanujan-numbers?)))
;; (display-stream-range (stream-of-ramanujan-numbers) 0 0)
;;(define (stream-of-ramanujan-numbers? s)
;;  (stream-map (lambda (x) (= (stream-car s) x)
;;		       x
;;		       (stream-cdr s)))
;;   (stream-of-ramanujan-numbers? (stream-cdr s))))
;; (display-stream-range (stream-of-ramanujan-numbers? (stream-of-sum-of-each-pair pairs-of-triple-numbers)) 0 10)

;; (define (inner stream)
;;    (let ((stream-value (stream-car stream)))


;;      (if (= stream-value)
;;  (inner (stream-of-sum-of-each-pair s)))


;;  (pairs-of-triple-numbers

;; (display-stream-range integers-of-cube 0 10)
;; (display-stream-range integers-ofcube 0 10)

;;(define pairs-of-triple-numbers
;;  (pairs integers integers))
