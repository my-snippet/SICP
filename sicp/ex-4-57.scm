;; It's quite intersting each language version descripton(English, Korean) of this exercise

(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)

;;(job ?x ?y)
;;(outranked-by (fect cy d) ?x)
;;(lives-near (fect cy d) ?x)
;;(job (fect cy d) ?x)
;;(same1 (fect cy d) (fect cy d))

;;(cr (fect cy d) ?x)
(cr2 (fect cy d) ?x)
