(load "ex-1-22.scm")

;; All the values were rounded.

;; 10000
(sqrt 100000000)

;; 31623
(sqrt 1000000000)

;; 100000
(sqrt 10000000000)

;; .18
(primes-from 100000000 10)

;; .54
(primes-from 1000000000 10)

;; 1.56
(primes-from 10000000000 10)

;; Time complexity was increased about 3 times when the value was muliplied by 10.
;; not exactly but quite matched.
