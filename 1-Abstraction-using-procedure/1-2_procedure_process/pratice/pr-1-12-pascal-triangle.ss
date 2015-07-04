#lang racket

; Pascal's triangle
;; idea
;; if n <= 0, pascal-triangle(n) = 0
;; else if n <= 4, pascal-triangle(n) = 1
;; else if n is located in contour of triangle, 
;; then -->> pascal-triangle(n) = 
;; [pascal-triangle(n - height of triangle) +
;; pascal-triangle{(n - height of triangle)+1}]


(define (inc n)
  (+ n 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (pascal-triangle n)
  (define (get-height-count n)
    (define (get-height-count-inner a b)
      (if (>= (sum (lambda (f) f) a inc b) n)
          b
          (get-height-count-inner a (+ b 1))))
    (get-height-count-inner 1 1))

  (define (get-width-count n)
    (define (get-width-count-inner a b)
      (if (>= (sum (lambda (f) f) a inc b) n)
          (- n (sum (lambda (f) f) a inc (- b 1)))
          (get-width-count-inner a (+ b 1))))
    (get-width-count-inner 1 1))

  (define (pascal-triangle-inner
           height-count
           width-count)
    
    (if (>= n 1)
        (if (<= n 4)
            1
            (if (or (= width-count 1) 
                     (= width-count height-count))
                1
                (+ (pascal-triangle (- n height-count))
                   (pascal-triangle (+ (- n height-count) 1)))))
        0))
  (get-width-count n)
  (pascal-triangle-inner
   (get-height-count n)
   (get-width-count n)))


(define (display-pascal-triangle k n)
  (display (pascal-triangle k))
  (newline)
  (if (< k n)
      (display-pascal-triangle (+ k 1) n)
      (display (pascal-triangle k))))

(display-pascal-triangle 1 30)