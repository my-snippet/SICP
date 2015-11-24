#lang racket

(define (make-interval a b)
  (cons a b))

(define (lower-bound r)
  (car r))

(define (upper-bound r)
  (cdr r))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (make-center-percent c allowable-error)
  (make-interval (- c (* c allowable-error))
                 (+ c (* c allowable-error))))

(define (percent c)
  (/ (/ (- (cdr c) (car c)) 2.0) 
     (center c)))

(define r1 (make-center-percent 100 0.1))
r1
(percent r1)