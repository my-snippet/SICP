(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)


(reverse (1 2 3 4 5) ?z)
;;(reverse ?z (1 2 3 4 5))

(append-to-form (?a) ?b (1 2 3 4 5))
(append-to-form ?b (?a) (1 2 3 4 5))


(and (append-to-form (?a) ?b (1 2 3))
	 (append-to-form ?b (?a) ?y))
