(load "ex-2-29.scm")
(load "ex-2-29-var-table.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


;; Example mobile hierarchical structure
;; m : mobile
;; b : branch
;; l : length
;; w : weight
;; 
;;           m
;;           :
;;       b       b
;;       :       :       
;;     l   m   l   w
;;         :       
;;        ...

;; Example mobile physical structure
;; m : mobile
;; b : branch
;; : : rod(length) of branch
;; w : weight(sinker)
;;
;;      b   -   m   -   b
;;      :               :
;;      :               :
;;  b - m - b           w
;;  :       : 
;;  :       : 
;; ...     ...


(test-begin "balanced mobile")

;; Test scenario
;;
;; Given
;; - Branch b0, b1 has same torque, but different length, weight.
;; ( torque = length * weight )
;; - Branch b2 has m01 as a submobile.m0- Mobile m02 has b0, b2 as branches.
;; - Mobile m02 has b0, b2 in order as branches.
;; - Mobile m20 has b2, b0 in order as branches, that is, 
;; m02 and m20 are like a mirror relationship.
;; m02+m20 has branch that consists of m02 and m20 with same length,
;; that is, balanced mobile

(test-assert "eq? test for object comparisons"
			 (eq? b0-copy
				  b0))
			 
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

(test-end "balanced mobile")
