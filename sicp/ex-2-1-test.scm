(load "chap-2-1-1.scm")
(load "ex-2-1.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "allow negative rational numbers")

(define positive-num 10)
(define negative-num (- 10))

;; It raises "denominator can not be zero" error exception
(define r6 (make-rat-enhanced negative-num 0))

(define r1 (make-rat-enhanced positive-num positive-num))
(test-assert "pos / pos = pos / pos"
			 (and (positive? (numer r1))
				  (positive? (denom r1))))

(define r2 (make-rat-enhanced positive-num negative-num))
(test-assert "pos / neg = neg / pos"
			 (and (negative? (numer r2))
				  (positive? (denom r2))))

(define r3 (make-rat-enhanced negative-num positive-num))
(test-assert "neg / pos = neg / pos"
			 (and (negative? (numer r3))
				  (positive? (denom r3))))

(define r4 (make-rat-enhanced negative-num negative-num))
(test-assert "neg / neg = pos / pos"
			 (and (positive? (numer r4))
				  (positive? (denom r4))))

(define r5 (make-rat-enhanced 0 negative-num))
(test-assert "0 / neg = 0 / neg"
			 (and (zero? (numer r5))
				  (negative? (denom r5))))

(test-end "allow negative rational numbers")
