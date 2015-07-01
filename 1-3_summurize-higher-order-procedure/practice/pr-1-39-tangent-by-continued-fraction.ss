#lang racket

;; Formula By J. H. Lambert 

;; N = x^k
;; D = 2k-1

(define (square n)
  (* n n))

(define (fast-exp a n)
  (if (> n 0)
      (if (even? n)
          (square (fast-exp a (/ n 2)))
          (* a (fast-exp a (- n 1))))
      1))

(define (tan-cf x k)
  (define (tan-cf-inner i)
    (let ((n (fast-exp x i))
          (d (- (* 2 i) 1)))
      (if (< i k)
          (/ n
             (- d 
                (tan-cf-inner (+ i 1))))
          0)))
  (tan-cf-inner 1))

(tan-cf (/ pi 4.0) 100)
(tan-cf (/ pi 3.0) 100)
(tan-cf (/ pi (- 4.0)) 100) 
;; minus argument is slight different with positive, why?