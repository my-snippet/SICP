;; Reference
;; http://cparrish.sewanee.edu/cs376/sicp/microshaft.script 
(load "lib/query/ch4-query.scm")


(initialize-data-base exercise-db)
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

;; find a job can do another job
(can-do-job ?x (computer programmer))
(can-do-job ?x (administration . ?sub-part))
(can-do-job ?x (computer . ?sub-part))
(can-do-job (computer wizard) ?x)

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

			   
(lives-near ?x (Bitdiddle ben))
(outranked-by (tweakit lem e) (Bitdiddle ben))
(outranked-by (aull dewitt) (Bitdiddle ben))

;;;; Logic as programs
;;; append-to-form
(append-to-form () (c d) ?z)
(append-to-form (a b) ?y (a b c d))
(append-to-form () (a b c) ?z)

;; Think of it. how it(the query variables) works?
(append-to-form ?x ?y (a b c d))

;; It is implemented as query name, not quote value
(append-to-form (str1 str2) (str3) ?z)

;; Conjunction & Disjunction Study
(and (append-to-form ?x ?y (1 2))
	 (append-to-form ?y ?x (1 2)))
