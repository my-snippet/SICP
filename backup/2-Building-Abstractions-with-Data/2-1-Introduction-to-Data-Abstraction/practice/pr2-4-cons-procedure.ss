#lang racket

;; example cons, car, cdr
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else error "only 0 and 1 possible")))
  dispatch)

((cons 11 99) 0)
((cons 11 99) 1)

(define (car z) (z 0))
(define (cdr z) (z 1))

(car (cons 11 99))
(cdr (cons 11 99))
;;


;; lambda test
(define (lambda-test x y)
  (lambda (m) (m x y)))

(define (lambda-test-second z)
  (z (lambda (a b) a)))

(newline)
(lambda-test 2 5)
(lambda-test-second (lambda-test 2 5))
((lambda-test 2 5) (lambda (a b) (+ a b)))
;;


;; 
(define (cons-lambda x y)
  (lambda (m) (m x y)))

(define (car-lambda z)
  (z (lambda (a b) a)))

(define (cdr-lambda z)
  (z (lambda (a b) b)))
      
      
(car-lambda (cons-lambda 11 99))
(cdr-lambda (cons-lambda 11 99))
;;

;; process explanation
;; 1. (car-lambda (cons-lambda 11 99))
;; 2. ((cons-lambda 11 99) (lambda (a b) a)))
;; 3. (m 11 99)
;; 3. ((lambda (a b) a)) 11 99)
;; 4. ((lambda (11 99) 11)
;; 5. 11