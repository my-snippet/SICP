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
