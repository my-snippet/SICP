(load "ex-1-17.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "*_ test (iterative style multiplication)")

(test-assert "17 *_ 0 = 0 *_ 17 = 0"
			 (= (*_ 17 0) (*_ 0 17) 0))

(test-assert "(17 *_ 17) - (17 *_ 16) = 17"
			 (= (- (*_ 17 17) (*_ 17 16)) 17))

(test-end "*_ test (iterative style multiplication)")


(test-begin "*-recursive test (recursive style multiplication)")

(test-assert "17 *-recursive 0 = 0 *-recursive 17 = 0"
			 (= (*-recursive 17 0) (*-recursive 0 17) 0))

(test-assert "(17 *-recursive 17) - (17 *-recursive 16) = 17"
			 (= (- (*-recursive 17 17) (*-recursive 17 16)) 17))

(test-end "*-recursive test (recursive style multiplication)")
