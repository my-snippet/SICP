(load "lib/set/subset.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")
(load "lib/set/nums-freq.scm")


(test-begin "adjoin-set")

(define sub-set (list 4 5 6))
(define not-sub-set (list 4 5 (- 6)))
(define empty-set (list '()))
(define super-set (append (list 4 5 6) sub-set))

(test-assert (null? (car empty-set)))

(test-assert (subset? sub-set super-set))

(test-assert (not (subset? not-sub-set super-set)))

;; parsing an empty set is not implemented yet.
;;(test-assert (subset? empty-set super-set))

(test-end "adjoin-set")
