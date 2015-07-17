#lang racket

(define x (list (list 1 2) (list 3 4)))
(define y (list (list 1 2) (list 3 4) (list 5 6)))
(define z (list (list (list 1 2) (list 3 4) (list (list 5 6) (list 7 8)))))
x
y
z


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
            ;; inner cycle
            (cons (deep-reverse (car items))
                  (deep-reverse (cdr items)))
            
            ;; outer cycle
            (cons (list-ref items n)
                  (deep-reverse-inner items (- n 1))))))
  (deep-reverse-inner items (- (length items) 1)))

(deep-reverse x)
(deep-reverse y)
(deep-reverse z)

(display "Idea : if the car of items(argument) value is pair? THEN, repeat one more")