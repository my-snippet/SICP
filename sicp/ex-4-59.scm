(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
(query-driver-loop)


;; a.
(meeting ?division ?day-and-time)

;; b.
(meeting-time (hacker alyssa p) ?day-and-time)

;; c.
(meeting-time (hacker alyssa p) (wednesday ?time))
