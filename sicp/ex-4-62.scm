(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)


(last-pair (3) ?x)
(last-pair (1 2 3) ?x)
(last-pair (2 ?x) (3))

;; It doesn't work. because It doesn't know the original list.
(last-pair ?x (3))
