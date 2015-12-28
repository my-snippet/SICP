(load "lib/query/ch4-query.scm")


(initialize-data-base microshaft-data-base)
(query-driver-loop)


;; a.
(supervisor ?x (Bitdiddle Ben))

;; b.
(job ?x (accounting . ?type))

;; c.
(address ?x (Slumerville . ?type))
