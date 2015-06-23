#lang racket

;; GCD(a, b) = GCD(b, r)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;(gcd 26 0) ; some exception needed
(gcd 9 2)
(gcd 4 2)
(gcd 26 3)
(gcd 206 40)