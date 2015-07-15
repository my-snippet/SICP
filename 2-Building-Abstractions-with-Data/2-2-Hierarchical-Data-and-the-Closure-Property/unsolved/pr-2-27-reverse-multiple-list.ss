#lang racket

(define x (list (list 1 2) (list 3 4)))
x


(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (reverse items)
  (define (reverse-inner items n)
    (if (< n 0)
        null
        (cons (list-ref items n)
              (reverse-inner items (- n 1)))))
  (reverse-inner items (- (length items) 1)))

(reverse x)


(define (deep-reverse items)
  (display "Idea : if the car of items(argument) value is pair? THEN, repeat one more"))
  