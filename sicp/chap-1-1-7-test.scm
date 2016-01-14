(load "chap-1-1-7.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "sqrt using newton law")
;;; These tests calculates 0.001 accuracy

(test-assert "sqrt 2 value is in range 1.414 < x < 1.415"
			 (and (> (sqrt 2) 1.414)
				  (< (sqrt 2) 1.415)))

(test-assert "sqrt 0 value should be 0"
			 (= (sqrt 0)))


(test-end "sqrt using newton law")

;; display sqrt 1~10
(map (lambda (x) (sqrt x)) (list 1 2 3 4 5))
