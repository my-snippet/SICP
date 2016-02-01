(load "ex-1-39")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "tan-cf test")

(test-assert "compare tan-cf to tan"
			 (and (= (tan-cf (/ pi 3) 10) (tan (/ pi 3)))
				  (= (tan-cf (/ pi 4) 10) (tan (/ pi 4)))
				  (= (tan-cf (/ pi 5) 10) (tan (/ pi 5)))
				  (= (tan-cf (/ pi 6) 10) (tan (/ pi 6)))))

(test-end "tan-cf test")
