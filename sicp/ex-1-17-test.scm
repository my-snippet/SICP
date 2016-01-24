(load "ex-1-17.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "multiplication advanced test")

(test-assert "17 *_ 0 = 0 *_ 17 = 0"
			 (= (*_ 17 0) (*_ 0 17) 0))

(test-assert "(17 *_ 17) - (17 *_ 16) = 17"
			 (= (- (*_ 17 17) (*_ 17 16)) 17))

(test-end "multiplication advanced test")
