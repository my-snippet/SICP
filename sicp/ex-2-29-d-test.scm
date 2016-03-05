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

(test-assert "torque test"
			 (and (= (branch-torque b0)
					 (* length-0 structure-0))
				  (= (branch-torque b1)
					 (* length-1 structure-1))))

(test-assert "torque test : more than 2 levels branch"
			 (and (= (branch-torque b2)
					 (* length-2 (+ structure-0
									structure-1)))))

(test-assert "mobile-balanced"
			 (and (mobile-balanced? m01)
				  (mobile-balanced? m10)))

(test-assert "balanced? true case : 1 level depth"
			 (and (balanced? m01)
				  (balanced? m10)))

(test-assert "balanced? true case : 2 level depth"
			 (balanced? m0000))

(test-assert "balanced? false"
			 (and (not (balanced? m02))
				  (not (balanced? m20))))

(test-end "mobile using cons")
