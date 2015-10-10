(define (last-pair x)
  (if (null? (cdr x))
	  x
	  (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))
(car z)
(cadr z)
(caddr z)

;; This structure is similar to ring
;; It bites its tail to tail

;;(cdr z)
;;(last-pair z)
