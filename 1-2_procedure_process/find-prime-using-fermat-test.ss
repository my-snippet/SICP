#lang racket

;; Fermat test
;; If 
;; 1. n = prime number
;; 2. 0 < a < n
;; then, [remainder of {a^n and (a mod n)}] is 0

;; And if don't know n is prime number
;; If [remainder of {a^n mod n}] is (a),
;; then n would be prime number probabilistic

(define (square n)
  (* n n))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) 
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else 
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
;; The reason why [1 ~ n-1] not [2 ~ n-1] is to check '2'

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 3 0)
(fast-prime? 3 1)
(fast-prime? 5 1)
(fast-prime? 7 1000)
(fast-prime? 4 1)
(fast-prime? 4 1000)

;; Carmichael number test (pr-1-27)
(fast-prime? 561 100)
(fast-prime? 1105 100)
(fast-prime? 1729 100)
(fast-prime? 2465 100)
(fast-prime? 2821 100)
(fast-prime? 6601 100)
