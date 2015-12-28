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