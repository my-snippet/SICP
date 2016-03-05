(load "ex-2-29.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


;; Example mobile hierarchical structure
;; m : mobile
;; b : branch
;; l : length
;; n : number
;; 
;;           m
;;           :
;;       b       b
;;       :       :       
;;     l   m   l   n
;;         :       
;;        ...

;; Example mobile physical structure
;; m : mobile
;; b : branch
;; : : rod(length) of branch
;; O : weight(sinker)
;;
;;      b   -   m   -   b
;;      :               :
;;      :               :
;;  b - m - b           O
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

(define length-0 3)
(define structure-0 2)
(define b0 (make-branch length-0 structure-0))

(define length-1 2)
(define structure-1 3)
(define b1 (make-branch length-1 structure-1))
(define m01 (make-mobile b0 b1))
(define m10 (make-mobile b1 b0))

(define m00 (make-mobile b0 b0))
(define b00 (make-branch length-0 m00))
(define m0000 (make-mobile b00 b00))

(define length-of-b2 4)
(define structure-of-b2 m01)
(define b2 (make-branch length-of-b2 structure-of-b2))
(define m02 (make-mobile b0 b2))
(define m20 (make-mobile b2 b0))

(define b0-copy b0)

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
					 (* length-of-b2 (+ structure-0
										structure-1)))))

(test-assert "mobile-balanced"
			 (and (mobile-balanced? m01)
				  (mobile-balanced? m10)))

(test-assert "balanced? true case : 1 level depth"
			 (and (balanced? m01)
				  (balanced? m10)))

(test-assert "balanced? true case : 2 level depth"
			 (balanced? m0000))

;; m02, m20 has actually same torque. but 'balanced?' tests
;; whether each same levels of left, right branches have the same torque.
;; * refer to 'About direction problems'
;; therefore it should be false.
(test-assert "balanced? false"
			 (and (not (balanced? m02))
				  (not (balanced? m20))))

(test-end "balanced mobile")
