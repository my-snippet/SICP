;; refernce
;; http://community.schemewiki.org/?sicp-ex-2.5
;; http://www.billthelizard.com/2010/10/sicp-25-representing-pairs-as-product.html
;; http://community.schemewiki.org/?sicp-ex-2.5

;; It uses a skill (or principle)
;; X = 2^a*3^b = even value * odd value
;; if (2^a / X) = 0 ? then (car X) -> a 
;; (a is the largest exponential that can divides X)

(define (cons_ a b)
  (* (expt 2 a) (expt 3 b)))

(define (count-0-remainder-divisions n divisor)
  (define (iter try-exp)
	(if (= 0 (remainder n (expt divisor try-exp)))
		(iter (+ try-exp 1))  ;; Try another division.
		(- try-exp 1)))

  ;; Start at 1, as 0 will obviously pass.
  (iter 1))

(define (car_ z) (count-0-remainder-divisions z 2))
(define (cdr_ z) (count-0-remainder-divisions z 3)) 
