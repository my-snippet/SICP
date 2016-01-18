(load "ex-1-11.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "value test(recursive)")

(test-assert "if n<3, then f(n)=n"
			 (and (= (f (- 10)) (- 10))
				  (= (f 0) 0)
				  (= (f 2) 2)))

(test-assert "f(4) = f(4-1) + 2f(4-2) + 3f(4-3)"
			 (and (= (f 4)
					 (+ (f (- 4 1)) (* 2 (f (- 4 2))) (* 3 (f (- 4 3)))))))

(test-assert "f(7) = f(6) + 2f(5) + 3f(4)"
			 (and (= (f 7)
					 (+ (f 6) (* 2 (f 5)) (* 3 (f 4))))))

(test-end "value test(recursive)")
