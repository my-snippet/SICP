#lang racket

;; Idea
;; If remainder of (3k-1)/number is 0
;; then D = k+1
;; else D = 1
;; It should represents like this :
;; 1, 2, 1, 1, 4, 1, 1, 6, 1

(define temp-value 1.0)

(define (cont-frac n d k)
  (if (> k 0)
      (/ (n temp-value) 
         (+ (d temp-value)
            (cont-frac n 
                       d 
                       (- k 1))))
      0))
