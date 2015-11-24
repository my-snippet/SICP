#lang racket

(define temp-value 1.0)
(define inverse-phi-value-lowest-least-upper-bound 0.6180)
(define inverse-phi-value-greatest-lower-bound 0.6181)

;;  needed to fix recursive
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


;; cont-frac iterative
(define (cont-frac-iter n d k)
  (define (cont-frac-iter-inner k result)
    (if (> k 0)
        (cont-frac-iter-inner 
         (- k 1) 
         (/ (n temp-value) 
            (+ (d temp-value) 
               result)))
        result))
  
  (cont-frac-iter-inner k 0))

(define (cont-frac-iter-easy k)
  (cont-frac-iter (lambda (n) 1.0)
             (lambda (d) 1.0)
             k))


(cont-frac-iter-easy 10)
(cont-frac-iter-easy 11)
(cont-frac-iter-easy 12)


;; Check whether the two data is equal
(define (equal? f1 f2 k)
  (define (equal?-inner k)
    (if (> k 0)
        (and (= (f1 k) 
                (f2 k))
             (equal? f1 f2 (- k 1)))
        true))
  (equal?-inner k))

(equal? cont-frac-easy cont-frac-iter-easy 1000)
