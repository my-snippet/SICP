#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              null 
              sequence))

;(define (append seq1 seq2)
;  (accumulate cons 0 0))

;(define (length sequence)
  ;(accumulate ? 0 sequence))

(map (lambda (n) (* n n)) (list 1 3 5))
;(append (list 1 2) (list 3 4))
;(length (list 1 1 2))