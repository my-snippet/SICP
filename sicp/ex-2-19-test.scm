(load "ex-2-19.scm")

;; Below result are same because cc procedure evaluates all the cases.
;; it calls itself double, first one with the present money and next coin-value
;; second one with the money decreased by present coin-value
;; Therefore first one makes idempotence regardless of the order of coin-value

(cc 100 us-coins)
(cc 100 us-coins-reverse)
