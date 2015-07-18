#lang racket

(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
            (append rest (map <??> rest)))))

(subsets (list 1 2 3))