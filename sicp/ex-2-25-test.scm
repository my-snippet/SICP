(load "ex-2-25.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "select 7 in the hierarchical structures")

;; -> (1 2)
;;     : :
;;     v v
;;     1 2
;;
;; (cdr (1 2)) = (2)
(test-assert "warming up test"
			 (= 2
				(cadr (cons 1 (cons 2 '())))))

(test-assert "a"
			 (= 7
				(cadr (caddr a))))

(test-assert "b"
			 (= 7
				(caar b)))

(test-assert "c"
			 (= 7
				(cadr (cadr (cadr (cadr (cadr (cadr c))))))))

(test-end "select 7 in the hierarchical structures")
