(load "ex-2-62.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")
(load "lib/set/nums-freq.scm")
 

(test-begin "union-set")

(define sub-set (list 4 5 6))
(define super-set-a (append (list 4 5 6) sub-set))
(define super-set-b (append (list (- 4) (- 5) (- 6)) sub-set))

(test-assert "?"
			 (= 1 1))


(test-end "union-set")
