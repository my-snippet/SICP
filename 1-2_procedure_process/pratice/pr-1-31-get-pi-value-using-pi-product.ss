#lang racket

(define (square n)
  (* n n))

(define (double n)
  (+ n n))


;; ((2k+1) - 1)((2k+1) + 1) / (2k+1)^2
(define (pi-product-term k)
  (/  (* (- (+ (double k) 1) 1)
         (+ (+ (double k) 1) 1))
      (square (+ (double k) 1.0))))

(define (inc k)
  (+ k 1))

(define (product term k next n)
  (define (product-iter k result)
    (if (> k n)
        result
        (* (term k)
           (product-iter (next k) 
                         result))))
  (product-iter k 1))


(define (get-pi-value-using-pi-product n)
  (* 4 (product pi-product-term 1 inc n)))

(get-pi-value-using-pi-product 1)
(get-pi-value-using-pi-product 100)
(get-pi-value-using-pi-product 10000)