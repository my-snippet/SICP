(load "ex-2-29-d.scm")
(load "ex-2-29-d-var-table.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "mobile using cons")

(test-assert "mobile selector"
			 (and (eq? (left-branch m01)
					   b0)
				  (eq? (right-branch m01)
					   b1)))		 				  

(test-assert "branch selector"
			 (and (eq? (branch-length b0)
					   length-0)
				  (eq? (branch-structure b0)
					   structure-0)))

(test-assert "total-weight : single mobile"
			 (= (total-weight m01)
				(+ structure-0
				   structure-1)))

(test-assert "total-weight : multiple mobile"
			 (= (total-weight m02)
				(+ structure-0
				   (+ structure-0
					  structure-1))))

(test-assert "total-weight : more multiple mobile"
			 (= (total-weight m03)
				(+ structure-0
				   (total-weight m02))))

(test-end "mobile using cons")
