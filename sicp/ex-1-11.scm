(define (f n)
  (cond ((< n 3) n)
		(else (+ (f (- n 1))
				 (* 2 (f (- n 2)))
				 (* 3 (f (- n 3)))))))


;; reference
;; http://community.schemewiki.org/?sicp-ex-1.11
(define (f-iterate n)
  (define (f-iter count n f1 f2 f3)
	(if (= count n) f3 (f-iter (+ count 1) n f2 f3 (+ (* 3 f1) (* 2 f2) f3))))
  (if (<= n 3) n (f-iter 3 n 1 2 3)))
