(load "ex-1-23.scm")

(primes-from 100000000 10)

(primes-from 1000000000 10)

(primes-from 10000000000 10)

;; It is improved about 1.44 times, actuaaly.
;; in Simple theory, it should haved been 2 times improved.
;; I think The reason of difference is for procedure call,
;; return, predicate, operation
;; Reference : http://www.billthelizard.com/2010/02/sicp-exercise-123-improved-prime-test.html
