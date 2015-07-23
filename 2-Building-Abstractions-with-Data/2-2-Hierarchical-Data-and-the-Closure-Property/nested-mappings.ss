#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval k n)
  (if (> k n)
      null
      (cons k (enumerate-interval (+ k 1) n))))

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
  (prime? (+ (car pair) (cdr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cdr pair) (+ (car pair) (cdr pair))))