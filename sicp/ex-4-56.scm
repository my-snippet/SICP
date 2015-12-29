;; Reference
;; http://cparrish.sewanee.edu/cs376/sicp/microshaft.script 
(load "lib/query/ch4-query.scm")


(initialize-data-base microshaft-data-base)
(query-driver-loop)


;; 1.
(and (supervisor ?name (Bitdiddle Ben))
	 (address ?person ?where))

;; 2.
(and (salary (Bitdiddle Ben) ?bens-salary)
	 (salary ?name ?amounts)	 	 
	 (lisp-value < ?amounts ?bens-salary))

;; 3.
;;(and (not (job ?person (computer programmar)))
;;	 (supervisor ?name ?a))
