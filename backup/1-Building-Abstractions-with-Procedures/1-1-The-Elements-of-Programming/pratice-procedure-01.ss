#lang racket

; Prefix notation applying to polynomial expression
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))))


; Procedure example
; input: 3 value, output: sum of two squared value of two bigger value of 3 value
(define (example-procedure x y z) 
  (if (> x y)
      (if (> y z)
          (+ (* x x) (* y y)) 
          (+ (* x x) (* z z))
          )
      (if (> x z)
          (+ (* y y) (* x x))
          (+ (* y y) (* z z))
          )
      ) 
  )

(example-procedure 1 2 3)