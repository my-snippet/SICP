(define (cons_ x y) 
  (lambda (m) (m x y)))

(define (car_ z) 
  (z (lambda (p q) p)))

(define (cdr_ z) 
  (z (lambda (p q) q)))

(define (cddr_ z) 
  (cdr_ (cdr_ z)))

(define (cdar_ z) 
  (car_ (cdr_ z)))
