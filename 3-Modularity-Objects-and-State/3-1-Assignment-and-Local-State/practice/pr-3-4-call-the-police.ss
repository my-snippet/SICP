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
        (lambda (p)
          (begin (set! try (+ try 1))
                 (if (>= try 7)
                     (call-the-cops)
                     (display "Incorrect Password")    
                     )))))
  
  (define (call-the-cops)
    (newline)
    (display "Call the cops")
    (newline))
  
  (define try 0)
  dispatch)

(define acc (make-account 100 'secret-password))

((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)