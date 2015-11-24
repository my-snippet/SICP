#lang racket

(define balance 100) 

(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount)) 
             balance)
      "Insufficient funds"))

(withdraw 50)
(withdraw 51)
(withdraw 50)

;; withdraw has problem because 
;; "balance is a name defined in the global environment and is freely accessible to be examined
;; or modified by any procedure." (p299 SICP)


(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount)) balance)
          "Insufficient funds"))))

(new-withdraw 20)
;; new-withdraw has a limit.
;; it fix the initial balance to 100


(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds")))

(define w1 (make-withdraw 100))
(define w2 (make-withdraw 1004))
(w1 30)
(w2 34)
;; we can use make-withdraw like class
;; So we can use this definition like the instance


(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) 
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: MAKE-ACCOUNT"
                       m))))
  dispatch)

(define a1 (make-account 100))
((a1 'deposit) 30)
((a1 'withdraw) 30)