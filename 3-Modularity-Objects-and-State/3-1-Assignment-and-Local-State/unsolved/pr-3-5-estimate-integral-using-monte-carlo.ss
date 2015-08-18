#lang racket

(require "../../../modules/3/monte-carlo.ss")
(require "../../../modules/1/basic.ss")


(define (estimate-integral P x1 x2 y1 y2 trials)
  
  (define (random-in-range low high)
    (let ((range (- high low)))
      (+ low (random range))))
  
  (monte-carlo trials P))

(estimate-integral (lambda (x y)
                     (<= (+ (square (- x 5))
                            (square (- y 7))) 
                         (square 3)))
                   2 8
                   4 10
                   10)

