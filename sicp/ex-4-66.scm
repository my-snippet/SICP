(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)


;; it may causes infinite recursion.
(sum ?amount
	 (and (job ?x (computer programmer))
		  (salary ?x ?amount)))
