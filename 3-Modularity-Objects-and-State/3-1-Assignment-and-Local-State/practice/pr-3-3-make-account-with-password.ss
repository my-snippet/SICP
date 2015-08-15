#lang racket

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) 
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pwd m)
    (if (eq? pwd password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request: MAKE-ACCOUNT"
                           m)))
        (error "Incorrect Password")))
  dispatch)

(define acc (make-account 100 'secret-password))

;((acc 'some-other-password 'withdraw) 40)
((acc 'secret-password 'withdraw) 40)
((acc 'secret-password 'deposit) 40)