#lang racket

;; Find Prime using divides

(define (prime? n)
  (prime?-inner n 2))

(define (prime?-inner n divisor)
  (if (= n divisor)
      (= (remainder n divisor) 0)
      (if (= (remainder n divisor) 0)
          (not (= (remainder n divisor) 0))
          (prime?-inner n (+ divisor 1)))))

(prime? 2)
(prime? 3)
(prime? 4)
(prime? 5)
(prime? 6)
(prime? 7)
(prime? 8)
(prime? 9)
(prime? 10)
(prime? 11)


;; Second solution by book

(define (smallest-divisor n)
  (find-divisor n 2))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime?-example-2 n)
  (= n (smallest-divisor n)))

(prime?-example-2 2)
(prime?-example-2 3)
(prime?-example-2 4)
(prime?-example-2 5)
(prime?-example-2 6)
(prime?-example-2 7)
(prime?-example-2 8)
(prime?-example-2 9)
(prime?-example-2 10)
(prime?-example-2 11)
