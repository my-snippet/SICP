#lang racket

(define dx 0.00001)

(define (smooth f)
  
  (define (average a b c)
    (/ (+ a b c) 3.0))
  
  (lambda (x)
    (average 
     (f (- x dx))
     (f x) 
     (f (+ x dx)))))

(define (repeated f x)
  (define (repeated-inner n)
    (if (> n 0)
        (f (repeated-inner (- n 1)))
        x))
  (lambda (n) (repeated-inner n)))

((smooth (lambda (n) (* n n n))) 4.0)
((smooth (lambda (n) (- (* n n n) 0.9))) 2)

;; smooth 'f' n times
(((repeated smooth (lambda (n) (* n n n))) 6) 4)

(define (smooth-n-times f n)
  (lambda (x) 
    (((repeated smooth f) n) x)))

((smooth-n-times (lambda (n) (* n n n))
                10) 4)