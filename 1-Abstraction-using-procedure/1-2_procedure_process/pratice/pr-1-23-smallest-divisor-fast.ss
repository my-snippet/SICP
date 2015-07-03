#lang racket

(define (divides? a b)
  (= (remainder b a) 0))

(define (smallest-divisor-fast n)
  (find-divisor n 2))

(define (square n)
  (* n n))

(define (next test-divisor)
  (cond ((= test-divisor 2) (+ test-divisor 1))
        (else (+ test-divisor 2))))


(define (find-divisor n test-divisor)  
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))


(smallest-divisor-fast 27)
(smallest-divisor-fast 2792819)

(smallest-divisor-fast 24)
(smallest-divisor-fast 2402090)

;; I guess even number must be divided by 2.
;; That causes this procedure no less than two times previous procedure