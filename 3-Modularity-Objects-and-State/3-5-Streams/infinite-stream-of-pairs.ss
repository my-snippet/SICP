;; (load "../../modules/3/stream.ss")
(load "../../modules/3/stream-advanced.ss")


;; Produce the stream of pairs(i, j) satisfying following conditions : i + j is prime, i <= j
;; IDEA
;;(stream-filter (lamda (pair)
;;		      (prime? (+ (car pair) (cadr pair))))
;;	       int-pairs)

