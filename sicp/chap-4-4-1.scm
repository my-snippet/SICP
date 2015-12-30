;; Reference
;; http://cparrish.sewanee.edu/cs376/sicp/microshaft.script 
(load "lib/query/ch4-query.scm")


(initialize-data-base microshaft-data-base)
(query-driver-loop)


(job ?x (computer programmer))
(supervisor ?x (Bitdiddle Ben))

;; Explain how it works
(supervisor ?x ?x)

(job ?x (computer ?type))

;; dot tail notation
(job ?x (computer . ?type))


;;; compound query
(and (job ?person (computer programmar))
	 (address ?person ?where))

(or (supervisor ?x (Bitdiddle Ben))
	(supervisor ?x (Hacker Alyssa P)))

(and (supervisor ?x (Bitdiddle Ben))
	 (not (job ?x (computer programmer))))

;; lisp-value is like a map
;; it apply an operation to queried value
(and (salary ?person ?amount)
	 (lisp-value > ?amount 30000))


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

(rule (outranked-by ?staff-person ?boss)
	  (or (supervisor ?staff-person ?boss)
		  (and (supervisor ?x ?staff-person)
			   (outranked-by ?staff-person
							 ?boss))))
			  
			   
(lives-near ?x (Bitdiddle ben))
(outranked-by (tweakit lem e) (Bitdiddle ben))
(outranked-by (aull dewitt) (Bitdiddle ben))
