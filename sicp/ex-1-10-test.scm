(load "ex-1-10.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")
(load "lib/basic/operations.scm")

(test-begin "ackermann function test")

(test-assert "(A 1 10) should be 2^10"
			 (= (A 1 10) (power 2 10)))

(test-assert "(A 2 2) should be 2^2"
			 (= (A 2 2) (power 2 2)))

(test-assert "(A 2 3) should be 2^(2^2)"
			 (= (A 2 3) (power 2 (power 2 2))))

(test-assert "(A 2 4) should be 2^(2^(2^2))"
			 (= (A 2 4) (power 2 (power 2 (power 2 2)))))

(test-assert "(A 3 2) should be (A 2 2)"
			 (= (A 3 2) (A 2 2)))

(test-assert "(A 3 3) should be (A 2 4)"
			 (= (A 3 3) (A 2 4)))

(test-end "ackermann function test")
