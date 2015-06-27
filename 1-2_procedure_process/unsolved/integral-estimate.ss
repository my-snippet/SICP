#lang racket

;; Why + ( 2k-1 / 2 ) * dx per term, not k * dx ??

;; do while f(a + k * dx + dx/2) < f(b)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube n)
  (* n n n))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.01)