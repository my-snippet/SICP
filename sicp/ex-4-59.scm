(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)


;; a.
(meeting ?division ?time)


;; b.
(meeting-time (hacker alyssa p) ?time)
