#lang racket

(define (make-monitored f)
  (define cnt 0)
  
  (define (mf m)
    (cond ((eq? m 'how-many-calls?) cnt)
          ((eq? m 'reset-count) (set! cnt 0))
          (else (set! cnt (+ cnt 1))
                (f m))))
  mf)

(define s (make-monitored sqrt))

(s 100)
(s 100)
(s 'how-many-calls?)
(s 100)
(s 'how-many-calls?)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?)

;; dispatch(mf) could get variable arguments by some modifications

;; Making expressions in the cond of mf as function(procedure) was hard because variable scope.