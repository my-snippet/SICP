(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)


(find-son Lamech ?x)

;;(find-grand-son Cain ?x)
;;(find-grand-son Methushael ?x)
