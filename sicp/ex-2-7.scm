(load "chap-2-1-4.scm")


(define (make-interval a b) (cons a b))

;; simple version 
;;(define (upper-bound i)
;;  (car i))
;;
;;(define (lower-bound i)
;;  (cdr i))

;; advanced version : more smart 
;; reference : http://community.schemewiki.org/?sicp-ex-2.7
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (lower-bound interval) (min (car interval) (cdr interval)))
