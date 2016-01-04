(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)


;; Only Lamech have Wife in the DB.
(wife Lamech ?x)
(wife Cain ?x)

(find-son Lamech ?x)
(find-son Cain ?x)
(find-son Methushael ?x)

(find-grand-son Cain ?x)
(find-grand-son Methushael ?x)
