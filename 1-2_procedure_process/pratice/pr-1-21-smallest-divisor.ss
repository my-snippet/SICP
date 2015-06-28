#lang racket

;; Comment about ((> (square test-divisor) n) n)
;; If a < test-divisor,
;; and a divides n, like a * b = n
;; then b > test-divisor, that is b is also divisor(but not smallest divisor)
;; So If (square test-divisor) is bigger than n
;; only n satisfies the condition

(define (divides? a b)
  (= (remainder b a) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (square n)
  (* n n))
  
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
  
(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)