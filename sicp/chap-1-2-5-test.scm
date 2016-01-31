(load "chap-1-2-5.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "relatively prime test")

(test-assert "5 and 8 are a relatively prime each other"
			 (= 1 (gcd 5 8)))

(test-assert "10 and 15 has a gcd, 5"
			 (= 5 (gcd 10 15)))

(test-end "relatively prime test")
