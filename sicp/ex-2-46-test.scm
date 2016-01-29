(load "ex-2-46.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "vector operation")

(define a (make-vect 5 10))
(define b (make-vect 10 5))

(test-assert "add-vect a to b"
			 (and (= (xcor-vect (add-vect a b)) (+ 5 10))
				  (= (ycor-vect (add-vect a b)) (+ 10 5))))

(test-assert "sub-vect a to b"
			 (and (= (xcor-vect (sub-vect a b)) (- 5 10))
				  (= (ycor-vect (sub-vect a b)) (- 10 5))))

(test-assert "scale-vect a to b"
			 (and (= (xcor-vect (scale-vect a b)) (* 5 10))
				  (= (ycor-vect (scale-vect a b)) (* 10 5))))

(test-end "vector operation")
