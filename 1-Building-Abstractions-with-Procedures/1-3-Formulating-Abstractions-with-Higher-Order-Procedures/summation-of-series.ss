#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n)
  (+ n 1))

(define (identity n)
  n)

(define (cube n)
  (* n n n))


;; ∑(x)
(define (sum-plus-1 a b)
  (sum identity a inc b))


;; ∑(x^3)
(define (sum-cubes a b)
  (sum cube a inc b))


(sum-cubes 2 2)
(sum-cubes 2 5)

(sum-plus-1 2 2)
(sum-plus-1 2 5)


;; Find PI value using Leibniz series
;; ∑(-1.0)^k / 2k + 1 -> π

(define (even? k)
  (= (remainder k 2) 0))

(define (leibniz-series-term k)
  (if (even? k)
      (/ 1.0 (+ (* 2 k) 1))
      (/ (- 1.0) (+ (* 2 k) 1))))

(define (leibniz-series a b)
  (sum leibniz-series-term
       a
       inc
       b))

(define (pi-value-using-leibniz-series n)
  (* 4 (leibniz-series 0 n)))


(leibniz-series-term 1)
(leibniz-series-term 2)
(pi-value-using-leibniz-series 10)
(pi-value-using-leibniz-series 1000)
(pi-value-using-leibniz-series 100000)