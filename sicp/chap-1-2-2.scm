;; Reference
;; http://c2.com/cgi/wiki?SicpIterationExercise

(define (count-change amount)
    (cc-new amount 5 0))

(define (cc-iter amount kinds-of-coins count)
  (cond ((= amount 0) (+ count 1))
		((or (< amount 0) (= kinds-of-coins 0)) count)
		(else (cc-iter (- amount (first-denomination kinds-of-coins))
					   kinds-of-coins
					   (cc-iter amount (- kinds-of-coins 1) count)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
		((= kinds-of-coins 2) 5)
		((= kinds-of-coins 3) 10)
		((= kinds-of-coins 4) 25)
		((= kinds-of-coins 5) 50)))
