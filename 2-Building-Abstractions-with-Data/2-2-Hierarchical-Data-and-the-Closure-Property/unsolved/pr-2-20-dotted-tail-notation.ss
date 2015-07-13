#lang racket

(define (even? n)
(= (remainder n 2) 0))

(define (same-parity a . sequence)
  (define (collect-odd sequence)
    (if (null? sequence)
        null
        (if (even? (car sequence))
            (same-parity a . (cdr sequence))
            (cons (car sequence)
                  (same-parity a . (cdr sequence))))))
    
  (define (collect-even sequence)
    (if (null? sequence)
        null
        (if (even? (car sequence))
            (cons (car sequence) 
                  (same-parity a . (cdr sequence)))
            (same-parity a . (cdr sequence)))))
  
  (if (even? a)
      (collect-even sequence)
      (collect-odd sequence)))
    
;(same-parity 1 2 3 4 5 6 7)
(same-parity 1 3 5 7)