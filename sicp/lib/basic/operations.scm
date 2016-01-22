(define (power a n)
  (if (= n 0)
	  1
	  (* a (power a (- n 1)))))

(define (arithmetic-seq a l d n)
  (/ (* n (+ a l)) 2))

(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
	  product
	  (fact-iter (* counter product)
				 (+ counter 1)
				 max-count)))

(define (permutation n r)
  (/ (factorial n) (factorial (- n r))))

(define (combination n k)
  (/ (permutation n k) (factorial k)))

(define phi (/ (+ 1 (sqrt 5)) 2))

(define (gradually-decreasing f1 f2 n)
  (define (gd-iter k previous-result)
	(if (> k n)
		True
		(let ((now-result (abs (- (f1 k) (f2 k)))))
		  (let ((decreased? (> previous-result now-result)))
			(display now-result)
			(newline)
			(if decreased?							   
				(gd-iter (+ k 1) now-result)
				(error
				 "It has been decreased from 0 to" (- k 1) ", not decreased from" k
				 ))))))
  (gd-iter 0 1))


(define (square x)
  (* x x))
