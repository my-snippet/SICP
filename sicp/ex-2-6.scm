;; https://en.wikipedia.org/wiki/Church_encoding

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (church-number n)
  (if (= n 0)
	  zero
	  (add-1 (church-number (- n 1)))))
