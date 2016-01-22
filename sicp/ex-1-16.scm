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
