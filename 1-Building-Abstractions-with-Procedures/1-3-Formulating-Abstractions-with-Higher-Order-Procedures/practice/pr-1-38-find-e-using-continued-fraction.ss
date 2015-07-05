#lang racket

;; Idea
;; If remainder of 3/number is 2
;; then D = k+1
;; else D = 1
;; It should represents like this :
;; 1, 2, 1, 1, 4, 1, 1, 6, 1
;; e = 2.71828

(define temp-value 1.0)

(define (cont-frac-iter n d k)
  (define (cont-frac-iter-inner k result)
    (if (> k 0)
        (cont-frac-iter-inner (- k 1)
                              (/ (n k)
                                 (+ (d k)
                                    result)))
        result))
  (cont-frac-iter-inner k 0))

(define (find-quotient op1 op2)
  (define (find-quotient-inner k)
    (if (> (* (+ k 1) op2) op1)
        k
        (find-quotient-inner (+ k 1))))
  (find-quotient-inner 0))

(define (cont-frac-find-e-easy k)
  (cont-frac-iter (lambda (n) 1.0)
             (lambda (d) (if (= (remainder d 3) 2)
                             (+ (* (find-quotient d 3) 
                                   2) 
                                2.0)
                             1.0))
             k))

(define (estimate-e k)
  (+ (cont-frac-find-e-easy k) 0.0))

(estimate-e 1)
(estimate-e 2)
(estimate-e 5) 
(estimate-e 8) ;; correspond the 4 digit after the decimal point with e