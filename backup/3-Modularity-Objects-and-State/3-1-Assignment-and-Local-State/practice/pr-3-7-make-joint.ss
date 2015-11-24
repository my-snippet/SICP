#lang racket

;; I've made this as independent password, not sharing password
;; For sharing password, make-account procedure should be changed
;;
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
              ((eq? m 'auth) true)
              (else (error "Unknown request: MAKE-ACCOUNT"
                           m)))
        (error "Incorrect Password")))
  dispatch)

(define (make-joint account password second-pwd)
  (if (account password 'auth)
      (lambda (pwd m)
        (cond ((eq? pwd second-pwd) (account password m))
              (else (error "Incorrect Password"))))
      (error "Incorrect Password")))


(define peter-acc (make-account 100 'open-sesame))
(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))

((paul-acc 'rosebud 'deposit) 30)
((peter-acc 'open-sesame 'withdraw) 30)