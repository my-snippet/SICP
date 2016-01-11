(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)


(reverse (1 2 3 4 5) ?z)
(rev-lhs (1 2 3 4 5) ?z)
(rev-rhs ?z (1 2 3 4 5))
