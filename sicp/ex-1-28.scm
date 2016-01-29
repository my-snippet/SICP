;; reference: http://www.billthelizard.com/2010/03/sicp-exercise-128-miller-rabin-test.html
(load "chap-1-2-6.scm")


(define (square-check x m)
;;  (display (remainder (* x x) m))
  (newline)
  (if (and (not (or (= x 1) (= x (- m 1))))
		   (= (remainder (* x x) m) 1))
	  0
	  (remainder (* x x) m)))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
		((even? exp)
		 (square-check (expmod base (/ exp 2) m) m))
		(else
		 (remainder (* base (expmod base (- exp 1) m))
					m))))

(define (miller-rabin-test n)
  (define (try-it a)
	(= (expmod a (- n 1) n) 1))
  (try-it (+ 2 (random-integer (- n 2)))))


(miller-rabin-test 561)
(miller-rabin-test 11)
