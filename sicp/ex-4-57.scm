;; It's quite intersting each language version descripton(English, Korean) of this exercise

(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)

;; a.
(replace (fect cy d) ?x)

;; b.
(and (salary ?person ?amount)
	 (replace ?person ?x)
	 (salary ?x ?y)
	 (lisp-value > ?y ?amount))


;;;; Preserve to know the implementation process
;;(cr (fect cy d) ?x)
;;(cr2 (fect cy d) ?x)
;;(cr3 (fect cy d) ?x)
;;(cr4 (fect cy d) ?x)
;;(cr5 (fect cy d) ?x)
;;(cr6 (fect cy d) ?x)
;;(cr7 (fect cy d) ?x)
;;(cr8 (fect cy d) ?x)
;;;;
