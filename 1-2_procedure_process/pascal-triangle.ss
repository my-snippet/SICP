#lang racket

; Pascal's triangle

(define (pascal-triangle n)
  (pascal-triangle-inner 0 0 0 n 0))

(define (pascal-triangle-inner count count-in-cycle cycle n result)
  (cond ((< n 1) 0)))
         
        
        
        
        
(pascal-triangle (- 4))
(pascal-triangle 0)
(pascal-triangle 1)