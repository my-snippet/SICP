#lang racket

;; Estimate x of equation
;; 1. Without let
;; 2. Using let
;; different with book, These procedure use
;; (close-enough? (f neg-point) (f pos-point)) Rather than
;; (close-enough? neg-point pos-point)

(define (square n)
  (* n n))

;; y = 1/2x^2 -2
(define (f1 x)
  (- (/ (square x) 2.0) 2))

(define (close-enough? neg-point pos-point)
  (< (abs (+ neg-point pos-point)) 0.1))

(define (get-mid-point a b)
  (/ (+ a b) 2.0))

;; 1. Without let
(define (find-x f neg-point pos-point)
  (if (close-enough? (f neg-point) (f pos-point))
      (get-mid-point neg-point pos-point)
      
      (cond ((> (f (get-mid-point neg-point pos-point))
                0)
             (find-x f
                     neg-point
                     (get-mid-point neg-point pos-point)))
            ((< (f (get-mid-point neg-point pos-point))
                0)
             (find-x f
                     (get-mid-point neg-point pos-point)
                     pos-point))
            (else (get-mid-point neg-point pos-point))
            )))

(find-x f1 1 9)
(find-x f1 (- 10) 10)
(find-x f1 (- 10) 13)


;; 2. Using let
(define (search f neg-point pos-point)
  (let ((mid-point (get-mid-point neg-point pos-point)))
    (if (close-enough? (f neg-point) (f pos-point))
        mid-point
        (let ((f-value (f mid-point)))
          (cond ((positive? f-value)
                 (search f neg-point mid-point))
                ((negative? f-value)
                 (search f mid-point pos-point))
                (else mid-point))))))

(search f1 1 9)
(search f1 (- 10) 10)
(search f1 (- 10) 13)