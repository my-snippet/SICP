(load "chap-1-1-7.scm")


;; improve-slightly has some problem
;; For example, if abs(guess - x) = 0.000999999999... then
;; too many improve-slightly required when it adjusts 0.0005

(define (sqrt-iter-slightly guess x times)
  (if (good-enough? guess x)
	  times
	  (sqrt-iter-slightly (improve-slightly guess x) x (+ times 1))))

(define (improve-slightly guess x)
  ;; There is no possible : guess = x
  ;; Because good-enough? checks it.
  (if (> guess x)
	  (- guess 0.0005)
	  (+ guess 0.0005)))
		
(define (sqrt-slightly x)
  (sqrt-iter-slightly 1.0 x 0))


;;; sqrt using newton method
(define (sqrt-iter-newton-law guess x times)
  (if (good-enough? guess x)
	  times
	  (sqrt-iter-newton-law (improve guess x) x (+ times 1))))
(define (sqrt-newton-law x)
  (sqrt-iter-newton-law 1.0 x 0))
(define (sqrt-iter-slightly guess x times)
  (if (good-enough? guess x)
	  times
	  (sqrt-iter-slightly (improve-slightly guess x) x (+ times 1))))

(define (improve-slightly guess x)
  ;; There is no possible : guess = x
  ;; Because good-enough? checks it.
  (if (> guess x)
	  (- guess 0.0005)
	  (+ guess 0.0005)))
		
(define (sqrt-slightly x)
  (sqrt-iter-slightly 1.0 x 0))


;;; sqrt using newton method
(define (sqrt-iter-newton-law guess x times)
  (if (good-enough? guess x)
	  times
	  (sqrt-iter-newton-law (improve guess x) x (+ times 1))))
(define (sqrt-newton-law x)
  (sqrt-iter-newton-law 1.0 x 0))
