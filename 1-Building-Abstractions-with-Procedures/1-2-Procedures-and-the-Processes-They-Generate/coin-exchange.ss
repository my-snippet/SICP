#lang racket

; Coin exhange
; How can this procedure solve the Duplication problem ?

(define (count-change amount)
  (cond ((<= amount 0) 0)
        (else (cc amount 5))))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0) 
        (else (+ (cc amount 
                     (- kinds-of-coins 1))
                 (cc (- amount 
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)
(count-change 25)
(count-change 20)
(count-change 10)
(count-change 5)
(count-change 4)
  
; Boundary condition
(count-change 0)
(count-change (- 1))