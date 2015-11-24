;; Description
;; if x = ('a, 'b), y = ('c, 'd)
;; (set-cdr! x y) makes x as
;; (append (cdr (last-pair x)) y) as x
;; that is " x <- (append x y) "

;; So this happens like this [a | -> [b | -> [ c | d] as x

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
	  x
	  (last-pair (cdr x))))

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
z
(cdr x)
;;(set-cdr! x y) ;; x <- (a c d)
;;(append! x y)
;;x
(define w (append! x y))
w
(cdr x)
