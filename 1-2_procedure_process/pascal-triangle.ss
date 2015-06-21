#lang racket

; Pascal's triangle

(define (pascal-triangle n)
  (pascal-triangle-inner 1 1 1 n))

(define (pascal-triangle-inner count count-in-cycle cycle n)
  (cond ((< n 1) 0)
        ((= count 
            n) (cond ((or (= count-in-cycle 
                             1)
                          (= count-in-cycle 
                             cycle)) 1)
                     (else (+ (pascal-triangle-inner 1 
                                                     1
                                                     1
                                                     (- n cycle))
                              (pascal-triangle-inner 1
                                                     1
                                                     1
                                                     (- n (+ cycle 1)))))))))
       

        
(pascal-triangle (- 4))
(pascal-triangle 0)
(pascal-triangle 1)
(pascal-triangle 2)