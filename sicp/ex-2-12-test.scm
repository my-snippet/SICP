(load "ex-2-12.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "intervals with percentage")
(define percent-tolerance 0.05)
(define center-value 500)
(define i1 (make-center-percent center-value
								percent-tolerance))

(test-assert "percent procedure returns percent of interval"
			 (= (percent i1) percent-tolerance))

(test-end "intervals with percentage")
