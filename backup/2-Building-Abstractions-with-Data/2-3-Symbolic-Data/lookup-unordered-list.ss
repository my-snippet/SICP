#lang racket

(require "../../modules/2/list-to-tree.ss")

;; Simple version : searching key 
;;
(define (lookup given-key set-of-records)
  (define (key set)
    (car set))

  (cond ((null? set-of-records) false)
        ((equal? given-key (key (car set-of-records)))
         (car set-of-records))
        (else (lookup given-key (cdr set-of-records)))))

(lookup 4 (list (list 4 'abracadabra)))