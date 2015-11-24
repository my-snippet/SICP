#lang racket

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-fold-right sequence)
  (fold-right (lambda (x y)
                (if (null? y)
                    (cons x y)
                    (append y (list x))))
              null sequence))
 
(define (reverse-fold-left sequence)
  (fold-left (lambda (y x)
               (if (null? y)
                   (cons x y)
                   (append (list x) y)))
             null sequence))

(reverse-fold-right (list 1 2 3))
(reverse-fold-left (list 1 2 3))

;; Description : reverse-fold-left
;; (append ... (append (list 3) (append (list 2) (cons 1 null))) ...)