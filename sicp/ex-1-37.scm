;; old version
;;(define (cont-frac-recur n d k)
;;  (if (= k 0)
;;	  0
;;	  (/ (n 'dummy) (+ (d 'dummy)
;;					   (cont-frac-recur n d (- k 1))))))


;; reference : http://community.schemewiki.org/?sicp-ex-1.37
;; applying i version
;; pay attention to 'predicate'
(define (cont-frac-recur n d k)
  (define (recur i)
	(if (> i k)
		0
		(/ (n i) (+ (d i)
					(recur (+ i 1))))))
  (recur 1))

(define (cont-frac-iter n d k)
  (define (iter i result)
	(if (= i 0)
		result
		(iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))

(define (cont-frac n d k)
  (cont-frac-iter n d k))
