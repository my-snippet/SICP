;; square is built-in proc in mit-schime. but for
;; ipython notebook kernel I added this.
(define (square x)
  (* x x))


(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
  (sqrt-iter 1.0 x))


;; Modification
;; Improve : Average of guess and x
(define (improve-avg guess x)
  (average guess x))
(define (sqrt-iter-avg guess x)
  (if (good-enough? guess x)
	  guess
	  (sqrt-iter-avg (improve-avg guess x) x)))
(define (sqrt-avg x)
  (sqrt-iter-avg 1.0 x))

;; It closes to x. You can know this calculating in person.
;;(sqrt-avg 2)
