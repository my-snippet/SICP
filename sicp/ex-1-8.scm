(load "chap-1-1-7.scm")


(define (cubing x)
  (* x x x))

;; same name function outside of procedure is allowed When using Block structure
;; but when I use ipython scheme kernel, it causes a problem. So I changed duplicate name.
(define (cube-root x)
  (define (good-enough?- guess)
	(< (abs (- (cubing guess) x)) 0.001))

  (define (improve- guess)
	(/ (+ (/ x (square guess))
		  (* guess 2))
	   3))
  
  (define (cube-root-iter guess)
	(if (good-enough?- guess)
		guess
		(cube-root-iter (improve- guess))))
  
  (cube-root-iter 1.0))
