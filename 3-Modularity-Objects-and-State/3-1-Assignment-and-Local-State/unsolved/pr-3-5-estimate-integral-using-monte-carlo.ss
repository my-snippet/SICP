#lang racket

(require "../../../modules/3/monte-carlo.ss")
(require "../../../modules/1/basic.ss")


(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (q x1 x2 y1 y2 P)
  (let ((x (random-in-range x1 x2))
        (y (random-in-range y1 y2)))
    (lambda ()
      (begin
        (set! x (random-in-range x1 x2))
        (set! y (random-in-range y1 y2))
        (let ()
          (<= (+ (square (- x 5))
                 (square (- y 7))) 
              (square 3)))))))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (monte-carlo trials P))



;; Circle Equation : (x - cx)^2 + (y-cy)^2 <= r^2
(define (P cx cy r)
  (lambda (x y)
    (<= (+ (square (- x cx))
           (square (- y cy))) 
        (square r))))

((q 2 8 4 10 (P 5 7 3)))