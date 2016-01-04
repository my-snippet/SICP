(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)


(find-grand-son Cain ?x)
(find-son Lamech ?x)
(find-grand-son Methushael ?x)
