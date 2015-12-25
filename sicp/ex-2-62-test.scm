(load "ex-2-62.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")
(load "lib/set/nums-freq.scm")
(load "lib/set/subset.scm")
(load "lib/set/basic.scm")
 

(test-begin "union-set")

(define sub-set (list 4 5 6))
(define super-set-a (append (list 4 5 6) sub-set))
(define super-set-b (append (list (- 4) (- 5) (- 6)) sub-set))

(test-assert "?"
			 (= 1 1))

(test-assert "intersection test"
			 ;; work in progress
			 ;; various range test needed. ( using Venn-diagram)
			 (let ((intersection-of-super-set
					(intersection-set super-set-a
									  super-set-b))
				   (union-of-super-set
					(union-set super-set-a
							   super-set-b))

				   (subset? intersection-a super-set-a))
				   

;;(test-assert "duplicate test")

;;(test-assert "not-contained test")

(test-end "union-set")
