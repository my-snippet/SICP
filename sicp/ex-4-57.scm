;; It's quite intersting each language version descripton(English, Korean) of this exercise

(load "lib/query/ch4-query.scm")
(load "lib/query/rules.scm")


(initialize-data-base microshaft-data-base)
(query-driver-loop)

;; test job procedure to find a worker list
(job ?x ?y)


;; in progress
;; person1 person2 someone
(rule (can-replace ?person2)
	  (or (job ?person2 ?person2-job)
		   (job ?person1 ?person2-job)
	  ))

	  
(can-replace (fect cy d))
;;(job (fect cy d) ?person2-job)
(job ?x (computer programmer))
