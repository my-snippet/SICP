(load "ex-1-24.scm")

;; All the values were rounded.

;; log2(100000000) = 26.58
;; log2(1000000000) = 29.90
;; log2(10000000000) = 33.22

;; .61
(primes-from 100000000 10)

;; .72
(primes-from 1000000000 10)

;; .86
(primes-from 10000000000 10)

;; Time complexity was increased about 1.18 times when the theory value was muliplied by 1.12
;; It seems quite different, but the increasing ratio is logarithmic either.
;; I think the reason of time difference is that there are other procedures
;; (try procedure, random, ...) that cause a slight latencies.
