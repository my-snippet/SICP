(load "ex-1-31.scm")
(load "lib/basic/operations.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "product test")

;; 3628800 is from haskell ghci
(test-assert "10! using product"
			 (= 3628800
				(product 1 identity inc 10)))

(test-assert "10! using product-recur"
			 (= 3628800
				(product-recur 1 identity inc 10)))

(test-end "product test")

(test-begin "pi approximation using product")

(test-assert "pi-using-product gradually close to 3.14"
			 (gradually-closing pi-using-product
								3.14159
								1000
								(lambda (x) (+ x 100))))

(test-end "pi approximation using product")

(pi-using-product 1)
(pi-using-product 10)
(pi-using-product 100)
(pi-using-product 1000)
