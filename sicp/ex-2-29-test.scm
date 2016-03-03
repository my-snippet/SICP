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

(define length-of-b0 3)
(define structure-of-b0 2)
(define b0 (make-branch length-of-b0 structure-of-b0))

(define length-of-b1 2)
(define structure-of-b1 3)
(define b1 (make-branch length-of-b1 structure-of-b1))
(define m01 (make-mobile b0 b1))

(define length-of-b2 4)
(define structure-of-b2 m01)
(define b2 (make-branch length-of-b2 structure-of-b2))
(define m02 (make-mobile b0 b2))
(define m20 (make-mobile b2 b0))

(define length-of-b3 5)
(define structure-of-b3 m02)
(define b3 (make-branch length-of-b3 structure-of-b3))
(define m03 (make-mobile b0 b3))

(define lengths-of-b02-and-b20 5)
(define structure-of-b02 m02)
(define structure-of-b20 m20)

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
					   length-of-b0)
				  (eq? (branch-structure b0)
					   structure-of-b0)))

(test-assert "total-weight : single mobile"
			 (= (total-weight m01)
				(+ structure-of-b0
				   structure-of-b1)))

(test-assert "total-weight : multiple mobile"
			 (= (total-weight m02)
				(+ structure-of-b0
				   (+ structure-of-b0
					  structure-of-b1))))

(test-assert "total-weight : more multiple mobile"
			 (= (total-weight m03)
				(+ structure-of-b0
				   (total-weight m02))))

(test-assert "torque test"
			 (and (= (branch-torque b0)
					 (* length-of-b0 structure-of-b0))
				  (= (branch-torque b1)
					 (* length-of-b1 structure-of-b1))))
					 
;;(test-assert "balanced? true"
;;			 (balanced? m02+m20))

;;(test-assert "balanced? false"
;;			 (and (not (balanced? m02))
;;				  (not (balanced? m20))))

(test-end "balanced mobile")
