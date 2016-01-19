(load "ex-1-12.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "value test")
;; pascal values
;; 1 / 1 1 / 1 2 1 / 1 3 3 1 / 1 4 6 4 1 / ...
(test-assert "(pascal-value 0 0) = 1"
			 (= (pascal-value 0 0) 1))

(test-assert "(pascal-value 1 1) = 1"
			 (= (pascal-value 1 1) 1))

(test-assert "(pascal-value 2 1) = 2"
			 (= (pascal-value 2 1) 2))

(test-assert "(pascal-value 4 1) = (pascal-value 4 3) = 4"
			 (= (pascal-value 4 1) (pascal-value 4 3) 4))

;; For more detail, make a big table to compare the pascal values
(test-end "value test")
