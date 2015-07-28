#lang racket

(require "basic.ss")
(provide fast-exp)

(define (fast-exp base exponent)
  (cond ((= exponent 0) 1)
        ((even? exponent)
         (square (fast-exp base (/ exponent 2))))
        (else
         (* base (fast-exp base (- exponent 1))))))