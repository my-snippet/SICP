#lang racket

(define (average a b)
  (/ (+ a b) 2.0))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-segment x1 y1 x2 y2)
  (cons (cons x1 y1) (cons x2 y2)))

(define (midpoint-segment segment) 
  ((lambda (a b)
     (cons (average (car a) (car b))
     (average (cdr a) (cdr b))))
   (start-segment segment)
   (end-segment segment)))

(define (print-point p) (newline)
  (display "(") (display (x-point p)) (display ",")
  (display (y-point p))
  (display ")"))

(define segment-a (make-segment 2 4 5 8))
(define segment-negative (make-segment (- 2) 4 5 (- 8)))

(start-segment segment-a)
(end-segment segment-a)
(midpoint-segment segment-a)
(midpoint-segment segment-negative)
;; test lambda for segment
(define (test segment)
  ((lambda (b)
    b)(start-segment segment)))
;; (test segment-a)