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
