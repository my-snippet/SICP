#lang racket

;; Idea
;; If remainder of 3/number is 2
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

(define (cont-frac-find-e-easy k)
  (cont-frac (lambda (n) 1.0)
             (lambda (d) (if (= (remainder k 3) 2)
                             (+ k 1)
                             1))
             k))