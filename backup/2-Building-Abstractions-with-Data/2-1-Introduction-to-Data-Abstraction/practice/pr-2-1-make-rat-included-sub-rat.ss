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
    (cond ((= d 0) false)
          ((= n 0) (cons 0 0))
          ((and (< n 0) (< d 0))
           (cons (abs (/ n g))
                 (abs (/ d g))))
          ((xor (< n 0) (< d 0))
           (cons (- (/ n g)) (abs (/ d g))))
          (else (cons (/ n g) (/ d g))))
        ))

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
(define one-half-sign-test (make-rat (- 1) (- 2)))

(define minus-one-half (make-rat 1 (- 2)))
(define minus-one-third (make-rat (- 1) 3))

(print-rat minus-one-half)
(print-rat minus-one-third)
(print-rat one-half-sign-test)

;; (1/3) + (1/2)
(print-rat (add-rat minus-one-third minus-one-half))

;; (- (1/2)) + (1/3)
(print-rat (add-rat minus-one-half one-third))

;; (- (1/2)) - (1/3)
(print-rat (sub-rat minus-one-half one-third))

;; (1/3) - (- (1/2))
(print-rat (sub-rat one-third minus-one-half))

;; (- (1/3)) + (1/2)
(print-rat (add-rat minus-one-third one-half))

;;
(define zero-denominator (make-rat 0 2))
(define zero-numerator (make-rat 2 0))

(print-rat zero-denominator)
;;(print-rat zero-numerator)