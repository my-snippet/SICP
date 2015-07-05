#lang racket

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; operation of rational number
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))


;; make rational number
(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (and (< n 0) (< d 0))
        (cons (abs (/ g n))
              (abs (/ g d)))
        (cons (/ n g) (/ d g))
        )))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))


;; print
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


;;
(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))

(define minus-one-half (make-rat 1 (- 2)))
(define minus-one-third (make-rat (- 1) 3))

(print-rat minus-one-third)
(print-rat minus-one-half)
(print-rat (add-rat minus-one-third minus-one-half))

(print-rat (add-rat minus-one-half one-third))
(print-rat (sub-rat minus-one-half one-third))


;; needed to fix
(print-rat (sub-rat one-third minus-one-half))
(print-rat (add-rat minus-one-third one-half))