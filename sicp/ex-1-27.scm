(load "chap-1-2-6.scm")


(define (carmichael? n)
  (define (test a)
	(cond ((= a 0) True)
		  ((not (= (expmod a n n) a)) False)
		  (else (test (- a 1)))))
  (test (- n 1)))
