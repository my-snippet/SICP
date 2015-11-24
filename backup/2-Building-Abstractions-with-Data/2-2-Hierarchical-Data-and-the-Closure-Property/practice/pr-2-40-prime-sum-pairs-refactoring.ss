#lang racket

(require "../../modules/sequence-operations.ss")
(require "../../modules/nested-mappings.ss")


(define (prime-sum-pairs n)
  (define (unique-pairs i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
  
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                unique-pairs
                (enumerate-interval 2 n)))))

(prime-sum-pairs 10)