(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)


(lives-near ?person (Hacker Alyssa P))

;; duplicate problem
(lives-near ?person-1 ?person-2)

;;(lives-near-no-duplicate ?person-1 ?person-2)
(address ?person ?addr)
