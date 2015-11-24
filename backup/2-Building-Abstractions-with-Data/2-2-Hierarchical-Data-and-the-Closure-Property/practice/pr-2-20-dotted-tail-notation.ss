#lang racket

;; * This practice confused me for type. 

;; test
(define (f x . y)
  (display y)(newline)
  (display y)(newline))

; (f 1 2 3 4 5)


; test-2
(define test-list (list 1 3))
;(cdr (cdr test-list))


(define (even? n)
(= (remainder n 2) 0))

(define (same-parity a . sequence)
    
  (define (collect-odd seq-list)
    (if (null? seq-list)
        null
        (if (even? (car seq-list))
            (same-parity-inner (cdr seq-list))
            (cons (car seq-list)
                  (same-parity-inner (cdr seq-list))))))

  (define (collect-even seq-list)
    (if (null? seq-list)
        null
        (if (even? (car seq-list))
            (cons (car seq-list) 
                  (same-parity-inner (cdr seq-list)))
            (same-parity-inner (cdr seq-list)))))

  (define (same-parity-inner seq-list)
    (if (even? a)
        (collect-even seq-list)
        (collect-odd seq-list)))

  (same-parity-inner sequence))

(same-parity 1 2 3 4 5 6 7)
(same-parity 1 3 5 7)
(same-parity 2 4 6 8)
(same-parity 2 3 4 5 6 7 8 9 10)