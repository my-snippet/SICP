#lang racket


;; cons car cdr
(define x (cons 1 2))
(car x)
(cdr x)
;; (define x (cons 1 2 3)) ; cons allow only 2 argument, 
;; pair data structure


;; define multiple pair
(define y (cons 3 4))
(define z (cons x y))
(car z)
(cdr z)
(car (car z))


;; operation of rational number
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))
;;


;; make rational number
(define (make-rat n d)
  (cons n d))

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
(print-rat one-half)

(print-rat
 (add-rat one-half one-third))

(print-rat
 (sub-rat one-half one-third))

(print-rat
 (mul-rat one-half one-third))

(print-rat
 (div-rat one-half one-third))


;; change following result as Irreducible fractions
(print-rat
 (add-rat one-third one-third))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(define (make-rat-as-irreducible-fractions n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (add-rat-as-irreducible-fractions x y)
  (make-rat-as-irreducible-fractions
   (+ (* (numer x) (denom y))
      (* (numer y) (denom x)))
   (* (denom x) (denom y))))

(newline)
(print-rat
 (add-rat-as-irreducible-fractions one-third one-third))
