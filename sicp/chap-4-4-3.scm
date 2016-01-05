(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)

;;;; Compound query
;; the necessity of order of query
(and (job ?x (computer programmer))
	 (supervisor ?x ?y))
;;or

(and (supervisor ?x ?y)
	 (job ?x (computer programmer)))
;;If a company has many more supervisors than programmers (the usual case),
;;it is better to use the first form rather than the second because
;;the data base must be scanned for each intermediate result (frame)
;;produced by the first clause of the and.
;;;;

;; Infinite loop
;;(married Mickey ?who)	   
