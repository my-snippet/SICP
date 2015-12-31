(load "lib/query/ch4-query.scm")


(initialize-data-base microshaft-data-base)
(query-driver-loop)


;; the query language provides means for abstracting queries.
;; These are given by rules.
(rule (wheel ?person)
	  (and (supervisor ?middle-manager ?person)
		   (supervisor ?x ?middle-manager)))

;; each people lives in same town.
(rule (lives-near ?person-1 ?person-2)
	  (and (address ?person-1 (?town . ?rest-1))
		   (address ?person-2 (?town . ?rest-2))
		   (not (same ?person-1 ?person-2))))

(rule (same ?x ?x))


;; This rule seems important to know about recursive rule.
;; * boss does not mean CEO. It means Supervisor
(rule (outranked-by ?staff-person ?boss)
	  (or (supervisor ?staff-person ?boss)
		  (and (supervisor ?staff-person ?middle-manager)
			   (outranked-by ?middle-manager
							 ?boss))))
