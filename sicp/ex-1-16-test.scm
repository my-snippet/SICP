(load "ex-1-16.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "fast-expt-iter test")

(test-assert "2^0 = 1"
			 (= (fast-expt 2 0) 1))

(test-assert "2^1 = 2"
			 (= (fast-expt 2 1) 2))

(test-assert "2^9 = 512"
			 (= (fast-expt 2 9) 512))

(test-assert "2^10 = 1024"
			 (= (fast-expt 2 10) 1024))

(test-end "fast-expt-iter test")
(map (lambda (n) (fast-expt 2 n)) (list 1 2 3 4 5 10 11 12 13 14 15 20 21 22 23 24 25))

(test-begin "fast-expt-iter2 test")

(test-assert "2^0 = 1"
			 (= (fast-expt2 2 0) 1))

(test-assert "2^1 = 2"
			 (= (fast-expt2 2 1) 2))

(test-assert "2^9 = 512"
			 (= (fast-expt2 2 9) 512))

(test-assert "2^10 = 1024"
			 (= (fast-expt2 2 10) 1024))

(test-end "fast-expt-iter2 test")
(map (lambda (n) (fast-expt2 2 n)) (list 1 2 3 4 5 10 11 12 13 14 15 20 21 22 23 24 25))
