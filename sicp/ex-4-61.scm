(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)

(?x next-to ?y in (1 (2 3) 4))

;; It just come by first rule definition
;; I mean ->> (rule (?x next-to ?y in (?x ?y . ?u)))
(?x next-to 1 in (2 1 3 1))
