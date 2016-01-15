(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)

;; son
(relationship ?x Ada Jabal)
(relationship ?x Methushael Lamech)

;; father
(relationship ?x Jabal Lamech)

;; mather
(relationship ?x Jabal Ada)

;; grondson
(relationship ?x Methushael Jabal)
