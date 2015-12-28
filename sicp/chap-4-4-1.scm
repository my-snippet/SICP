(load "lib/query/ch4-query.scm")


(initialize-data-base microshaft-data-base)
(query-driver-loop)


(job ?x (computer programmer))
(supervisor ?x (Bitdiddle Ben))
