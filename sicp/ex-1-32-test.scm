(load "ex-1-32.scm")
(load "lib/basic/operations.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "acc-recur test")

;; 3628800 is from haskell ghci
(test-assert "10! using product-using-acc-recur"
			 (= 3628800
				(product-using-acc-recur 1 identity inc 10)))

(test-assert "sum[1..10] using sum-using-acc-recur"
			 (= 55
				(sum-using-acc-recur 1 identity inc 10)))

(test-end "acc-recur test")

(test-begin "acc test")

;; 3628800 is from haskell ghci
(test-assert "10! using product-using-acc-recur"
			 (= 3628800
				(product-using-acc 1 identity inc 10)))

(test-assert "sum[1..10] using sum-using-acc-recur"
			 (= 55
				(sum-using-acc 1 identity inc 10)))

(test-end "acc test")
