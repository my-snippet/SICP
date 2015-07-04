#lang racket

; Pascal's triangle

(define (pascal-triangle n)
  (pascal-triangle-inner 1 1 1 n 0))

(define (pascal-triangle-inner count cycle-count cycle n result)
  (cond (= count n) ((if (or (= cycle-count 0) (= cycle-count cycle))
                        1
                        result))
        (= (+ cycle-count 1) 
           cycle) (pascal-triangle-inner (+ count 1) 
                                         0 
                                         (+ cycle 1) 
                                         n 
                                         (+ (pascal-triangle-inner 0
                                                                   0
                                                                   0
                                                                   
        
        ;(else (+ (- n cycle) (- n (+ cycle 1))))))
