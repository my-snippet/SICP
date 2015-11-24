#lang racket

(require "../../modules/sequence-operations.ss")
(require "../../modules/nested-mappings.ss")


;; Planar figure
;;(flatmap (lambda (i) (flatmap (lambda (j) (map (lambda (k) (list i j k (+ i j k))) (list 1 2 3))) (list 4 5 6))) (list 7 8 9))
;; The reason it uses flatmap rather than 'map' is to remove (prenthesis) created by list operations

(define (triple n)
  (flatmap
   (lambda (i)
     (flatmap
      (lambda (j)
        (map
         (lambda (k)
           (list i j k (+ i j k)))
         (enumerate-interval 1 n)))
        (enumerate-interval 1 n)))
     (enumerate-interval 1 n)))

(triple 5)