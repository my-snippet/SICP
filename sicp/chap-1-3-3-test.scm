(load "chap-1-3-3.scm")
(load "lib/basic/operations.scm")


(fixed-point cos 1.0)
(fixed-point (lambda (y) (+ (sin y) (cos y)))
			 1.0)

;; a guess value enough small <-- average  --> n/guess
(define (sqrt x)
  (fixed-point
   (lambda (y) (average y (/ x y)))
   1.0))
(sqrt 2)
