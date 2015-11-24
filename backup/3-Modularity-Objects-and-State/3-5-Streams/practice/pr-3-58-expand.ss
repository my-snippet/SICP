(load "../../modules/3/stream.ss")


;; Description
;; This procedure evaluates number division.
;; But it can evaluates under the decimal points considered radix
;; den : divisor
;; radix : radix
;; num * radix : dividend

(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

(define 1*10-div-by-7 (expand 1 7 10))
(define 3*10-div-by-8 (expand 3 8 10))
(define 4*2-div-by-5 (expand 4 5 2))
(display-stream-range 1*10-div-by-7 0 10)
(display-stream-range 3*10-div-by-8 0 10)
(display-stream-range 4*2-div-by-5 0 10)
