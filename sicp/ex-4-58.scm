(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)

;; It results just name
(bigshot ?someone)

;; It results name and division
(bigshot2 ?someone ?division)

;;(supervisor ?x ?y)
;;(not (supervisor (warbucks oliver) ?y))
;;(job ?x ?y)
