#lang racket
;;
;; * cons property
;; (cons var1 var2)
;; if var1 is not single data ( like 1, not (1, 2) )
;; the result ((var1) var2)


(define one-to-five (list 1 2 3 4 5))
(define evens (list 2 4 6 8))

(cons (car evens) one-to-five)
(cons one-to-five (car evens))


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

(reverse evens)
(reverse one-to-five)