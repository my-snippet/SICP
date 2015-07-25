#lang racket

(require "sequence-operations.ss")


(provide find-divisor
         prime?
         flatmap
         prime-sum?
         make-pair-sum)


(define (find-divisor n)
  (define (find-divisor-iter k)
    (cond ((> k n) n)
          ((= (remainder n k) 0) k)
          (else (find-divisor-iter (+ k 1)))))
  (find-divisor-iter 2))

(define (prime? n)
  (if (= (find-divisor n) n) true false))


(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))