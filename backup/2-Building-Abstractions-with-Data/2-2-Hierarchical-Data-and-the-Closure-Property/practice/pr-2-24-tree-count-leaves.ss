#lang racket

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(count-leaves (list 1 2 3))

(count-leaves (list 1 (list 2 (list 3 4))))

;; description
;; 1. (list 1), (list 2 (list 3 4)))
;; 2. 1 + (list 2), (list 3 4)
;; 3. 1 + 1 + (list 3), (list 4)
;; 4. 1 + 1 + 1 + 1

;; Tree
;;        1
;;          2
;;        3   4