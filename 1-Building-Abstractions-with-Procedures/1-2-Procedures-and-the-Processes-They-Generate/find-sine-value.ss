#lang racket

; Find Sin(x) using
; sin(x) ≈ x when x < 0.1
; sin(x) = 3sin(x/3) - 4sin^3(x/3)
; Unit : radian (not pi radian)
 
(define (cube x)
  (* x x x))

;; One level version
(define (sine x)
  (cond ((< x 0.1) x)
        (else (- (* 3 
                    (sine (/ x 3.0))) 
                 (* 4 
                    (cube (sine (/ x 3.0))))))))


;; Two level version
(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine-example angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine-example (/ angle 3.0)))))
        

(sine-example 0)
(sine-example 0.5)
(sine-example 1)
(sine-example 2)
(sine-example 3.14)
(sine-example (/ 3.14 2.0))

(sine 0)
(sine 0.5)
(sine 1)
(sine 2)
(sine 3.14)
(sine (/ 3.14 2.0))


;; Following procedure was made to know the number of recursive count

(define (count-of-recursive value operand-for-divide min-value)
  (count-of-recursive-inner 0 
                            value 
                            operand-for-divide 
                            min-value))
  
(define (count-of-recursive-inner count value operand-for-divide min-value)
  (if (> value min-value)
      (count-of-recursive-inner (+ count 1) 
                                (/ value operand-for-divide) 
                                operand-for-divide min-value)
      count))


(count-of-recursive 12.5
                    3
                    0.1)