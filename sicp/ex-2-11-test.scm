(load "ex-2-7.scm")
(load "ex-2-11.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "mul-interval-9-cases test")

(test-assert "[-2 3] * [-2 3] should be [-6 9]"
			 (let ((npnp (mul-interval-9-cases np np)))
			   (and (= (- 6) (lower-bound npnp))
					(= 9 (upper-bound npnp)))))

(test-end "mul-interval-9-cases test")


(define n (- 2))
(define p 3) 

(define nn (make-interval (* 2 n) n))
(define np (make-interval n p))
(define pp (make-interval p (* 2 p)))


(mul-interval-9-cases pp pp)
(mul-interval-9-cases pp np)
(mul-interval-9-cases pp nn)

(mul-interval-9-cases np pp)
(mul-interval-9-cases np np)
(mul-interval-9-cases np nn)

(mul-interval-9-cases nn pp)
(mul-interval-9-cases nn np)
(mul-interval-9-cases nn nn)
