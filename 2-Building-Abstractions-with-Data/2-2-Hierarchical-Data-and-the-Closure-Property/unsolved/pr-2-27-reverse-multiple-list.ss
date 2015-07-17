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

(define (deep-reverse items)
  (define (deep-reverse-inner items n)
    (if (< n 0)
        null
        (if (pair? (list-ref items n))
            (cons (deep-reverse (car items))
                  (deep-reverse-inner items (- n 1)))
            (cons (list-ref items n)
                  (deep-reverse-inner items (- n 1))))))
  (deep-reverse-inner items (- (length items) 1)))

(deep-reverse x)


(display "Idea : if the car of items(argument) value is pair? THEN, repeat one more")