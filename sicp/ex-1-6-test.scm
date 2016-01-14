(load "ex-1-6")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "new-if")

(test-assert "new-if not recursive"
			 (and (new-if (= 2 3) 0 5)
				  (new-if (= 1 1) 0 5)))

(test-end "new-if")
