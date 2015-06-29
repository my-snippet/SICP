#lang racket

(define temp-value 1.0)
(define inverse-phi-value-lowest-least-upper-bound 0.6180)
(define inverse-phi-value-greatest-lower-bound 0.6181)

(define (cont-frac n d k)
  (if (> k 0)
      (/ (n temp-value) 
         (+ (d temp-value) 
            (cont-frac n 
                       d 
                       (- k 1))))
      0))

;; 1/phi = 0.61803398
(define (cont-frac-easy k)
  (cont-frac (lambda (n) 1.0)
             (lambda (d) 1.0)
             k))

;; try & error not good for high Uncertainty
(cont-frac-easy 10)
(cont-frac-easy 11)
(cont-frac-easy 12)


;; make test using code
(define (close-enough-to-inverse-phi? n)
  (and (> n inverse-phi-value-lowest-least-upper-bound)
       (< n inverse-phi-value-greatest-lower-bound)))

(define (find-inverse-phi-close-enough f)
  (define (find-inverse-phi-inner k)
    (let ((estimated-phi-value (f k)))
      (if (close-enough-to-inverse-phi? estimated-phi-value)
          k
          (find-inverse-phi-inner (+ k 1)))))
    (find-inverse-phi-inner 0))

(find-inverse-phi-close-enough cont-frac-easy)


;; To do : Make cont-frac iterative