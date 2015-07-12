#lang racket

;; 
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 5) 50)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 1) 1)))

(define (cc-old a n)
  (if (or (= n 0) (< a 0))
      0
      (if (= a 0)
          1
          (+ (cc-old a (- n 1))
             (cc-old (- a (first-denomination n)) n)))))

(define (cc-old-in-book amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (= kinds-of-coins 0) (< amount 0)) 0)
        (else (+ (cc-old-in-book 
                  (- amount 
                     (first-denomination kinds-of-coins))
                  kinds-of-coins)
                 (cc-old-in-book 
                  amount
                  (- kinds-of-coins 1))))))

(cc-old 50 0)
(cc-old 50 2)

(cc-old-in-book 50 0)
(cc-old-in-book 50 2)
