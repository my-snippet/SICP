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


;; pr 1-29
;; Integral estimation by Simpson's law

(define (simpson-law-term y k n)
  (cond ((even? k) (* 2 y))
        ((or (= k 0) (= k n)) y)
        (else (* 4 y))))

(define (inc n)
  (+ n 1))


(define (get-h a b n)
  (/ (- b a) (* n 1.0)))

;; customization
;; later it should be changed using sum

(define (sum-for-simpson-law term a next b k n)
  (if (> k n)
      0
      (+ (simpson-law-term (term (+ a 
                                    (* (get-h a b n)
                                       k)))
                           k
                           n)
         (sum-for-simpson-law term a next b (next k) n))))

(define (integral-by-simpson-law f a b n)
  (/  (* (get-h a b n)
         (sum-for-simpson-law f
                              a
                              inc
                              b
                              0
                              n))
      3.0))

(display "good\n")
(integral-by-simpson-law cube 0 1 10000)
(integral-by-simpson-law cube 0 1 100000)


(define (more-precise d1 d2 right-value)
  (if (< (abs (- right-value d1)) 
         (abs (- right-value d2)))
      (display "first function is more precise\n")
      (display "second function is more precise\n")))

(more-precise (integral cube 0 1 0.01) 
              (integral-by-simpson-law cube 0 1 10000)
              0.25)

(more-precise (integral cube 0 1 0.01) 
              (integral-by-simpson-law cube 0 1 100000)
              0.25)

(more-precise (integral cube 0 1 0.001) 
              (integral-by-simpson-law cube 0 1 100000)
              0.25)