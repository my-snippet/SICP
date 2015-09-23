(define x (list (list 1 2) 3 4))
(define y (list 5 6))
(define z (cons y (cdr x)))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)
