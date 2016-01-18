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


(test-begin "value test(iterative)")

(test-assert "if n<3, then f-iterate(n)=n"
			 (and (= (f-iterate (- 10)) (- 10))
				  (= (f-iterate 0) 0)
				  (= (f-iterate 2) 2)))

(test-assert "f-iterate(4) = f-iterate(4-1) + 2f-iterate(4-2) + 3f-iterate(4-3)"
			 (and (= (f-iterate 4)
					 (+ (f-iterate (- 4 1)) (* 2 (f-iterate (- 4 2))) (* 3 (f-iterate (- 4 3)))))))

(test-assert "f-iterate(7) = f-iterate(6) + 2f-iterate(5) + 3f-iterate(4)"
			 (and (= (f-iterate 7)
					 (+ (f-iterate 6) (* 2 (f-iterate 5)) (* 3 (f-iterate 4))))))

(test-end "value test(iterative)")
