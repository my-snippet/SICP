#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))


(define (dot-product v w)
  (accumulate + 0 (map * v w)))
;(dot-product (list 1 2) (list 3 4))


(define (transpose mat)
  (accumulate-n cons null mat))
;(transpose (list (list 1 2) (list 3 4)))


;; row * col <-- row : fixed to the one row
;; vector means a sequence in here (so, 1*1 matrix)
(define (matrix-*-vector m v)
  (map (lambda (x) (accumulate + 0 (map * x v))) m))
(matrix-*-vector (list (list 1 2) (list 3 4))
                 (list 5 6))


(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) 
           (map (lambda (y) 
                  (accumulate + 0 (map * x y))) cols)) m)))
(matrix-*-matrix (list (list 1 2) (list 3 4))
                 (list (list 5 6) (list 7 8)))