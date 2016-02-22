;; Reference for Mathmatical proof
;; https://wizardbook.wordpress.com/2010/12/01/exercise-2-9/
(load "ex-2-9.scm")
(load "ex-2-8.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "width test")

(define i1 (make-interval (- 3) 3))
(define i2 (make-interval 0 9))


(test-assert
 "width of the sum of two intervals should be equal to 
sum of the width of each interval"
 (= (width (add-interval i1 i2))
	(+ (width i1) (width i2))))

(test-assert
 "width of the subtraction of two intervals should be equal to 
sum of the width of each interval"
 (= (width (sub-interval i1 i2))
	(+ (width i1) (width i2))))

(test-end "width test")
