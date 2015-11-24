#lang racket

(define (subsets s)
  (define (bindings rest)
    (cons (car s) rest))
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
            (append rest (map bindings rest)))))

(subsets (list 1 2 3))
;; in bingins procedure, 
;; (car s) flows like this : 3221111
;; And rest : ()()(3)()(3)(2)(2 3)
;; add (car s) element to rest, then -->>

;; -->> Result : '(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

;; * map procedure apply proc to all the elements of the list
;; For example, (2 3), then (proc (2 3)) -> if (pair? (2 3)) -> (proc 2) -> (proc 3)

(subsets (list 1 2 3 4))