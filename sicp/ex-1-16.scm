(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  ;; It starts from n-count-rev = n, and ends when n-count-rev = 1
  ;; even-value should starts from b because when (square 1), it cannot be calculated.
  (define (fast-expt-iter even-value odd-value n-count-rev)
	(cond ((= n-count-rev 0) 1)
		  ((= n-count-rev 1) (* even-value odd-value))
		  ((even? n-count-rev)
		   (fast-expt-iter (square even-value) odd-value (/ n-count-rev 2)))
		  (else (fast-expt-iter even-value (* odd-value even-value) (- n-count-rev 1)))))
  (fast-expt-iter b 1 n))

;; http://www.billthelizard.com/2010/01/sicp-exercise-116-fast-exponentiation.html
;; corrected version
(define (fast-expt2 b n)
  (define (fast-expt-iter b n a)
	(cond ((= n 0) a)
		  ((even? n) (fast-expt-iter (square b) (/ n 2) a))
		  (else (fast-expt-iter  b (- n 1) (* a b)))))
  (fast-expt-iter b n 1))
