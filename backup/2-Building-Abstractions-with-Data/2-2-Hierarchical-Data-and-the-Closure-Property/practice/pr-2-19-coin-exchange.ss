#lang racket

;; The result is same.
;; Because the algorhythm checks all cases

(define us-coins (list 50 25 10 5 1))
(define us-coins-reverse (list 1 5 10 25 50))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define uk-coins-reverse (list 0.5 1 2 5 10 20 50 100))
(define kr-coins (list 100 50 10 1))
(define kr-coins-reverse (list 1 10 50 100))


(define (cc amount coin-values)

  (define (no-more? coin-values)
    (null? coin-values))

  (define (first-denomination coin-values)
    (car coin-values))

  (define (except-first-denomination coin-values)
    (cdr coin-values))

  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else (+ (cc amount
                     (except-first-denomination coin-values))
                 (cc (- amount
                        (first-denomination coin-values))
                     coin-values)))))
         
(cc 100 us-coins)
(cc 100 us-coins-reverse)
(newline)
(cc 100 uk-coins)
(cc 100 uk-coins-reverse)
(newline)
(cc 100 kr-coins)
(cc 100 kr-coins-reverse)
(newline)
  
;; Previous style
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

(cc-old-in-book 100 5)
