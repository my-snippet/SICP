#lang racket
; Linear recursive process
(define (fact-recursive n)
  (if (= n 1)
      1
      (* n (fact-recursive (- n 1)))))


; Linear iterative process
(define (fact-iterative n)
  (define (fact-iter counter product)
    (if (> counter n)
        product
        (* counter (fact-iter (+ counter 1) product))))
  (fact-iter 1 1))
  

; Why linear?
; Difference between recursive and iterative (process)?
; Difference between recursive procedure and recursive process?


(fact-recursive 4)
(fact-recursive 5)

(fact-iterative 4)
(fact-iterative 5)