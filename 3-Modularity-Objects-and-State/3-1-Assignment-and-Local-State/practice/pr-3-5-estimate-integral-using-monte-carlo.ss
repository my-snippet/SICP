#lang racket

(require "../../../modules/3/monte-carlo.ss")
(require "../../../modules/1/basic.ss")


;; If you need decimal random value
;; you can modify random-in-range
;; 1. range * 10^n(n is for under nth place)
;; 2. low * * 10^n(n is for under nth place)
;; But this example doesn't change random-in-range
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))


;; Circle Equation : (x - cx)^2 + (y-cy)^2 <= r^2
(define (circle-eq cx cy r)
    (lambda (x y)
      (<= (+ (square (- x cx))
             (square (- y cy)))
          (square r))))


(define (is-in-circle? cx cy r)
  (let ((x1 (- cx r))
        (x2 (+ cx r))
        (y1 (- cy r))
        (y2 (+ cy r)))
    (let ((x (random-in-range x1 (+ x2 1)))
          (y (random-in-range y1 (+ y2 1))))
      (lambda ()
        (begin
          (set! x (random-in-range x1 (+ x2 1)))
          (set! y (random-in-range y1 (+ y2 1)))
          (let ()
            ((circle-eq cx cy r) x y)))))))


(define (estimate-circle-area cx cy r trials)
  (* (monte-carlo trials (is-in-circle? cx cy r))
     (square (* 2 r))
     1.0))

;; MORE MANY ACCURATE VARIOUS TEST NEEDED
;; it should be about 3/4
;(monte-carlo 10 (is-in-circle? 0 0 30))
;(monte-carlo 100 (is-in-circle? 0 0 30))
;(monte-carlo 1000 (is-in-circle? 0 0 30))
;(monte-carlo 10000 (is-in-circle? 0 0 30))

;; It should be about 28.25 * 10^n, (n is radius * 10^n) 
;(estimate-circle-area 0 0 30 10)
;(estimate-circle-area 0 0 30 100)
;(estimate-circle-area 0 0 30 1000)
;(estimate-circle-area 0 0 30 10000)

;(estimate-circle-area 0 0 300 10)
;(estimate-circle-area 0 0 300 100)
;(estimate-circle-area 0 0 300 1000)
;(estimate-circle-area 0 0 300 10000)