;; https://en.wikipedia.org/wiki/Church_encoding

(define zero (lambda (f) (lambda (x) x)))

;; this is equivalent to the successor. (see 'wikipedia' link above)
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define three (lambda (f) (lambda (x) (f (f (f x))))))

(define (church-number n)
  (if (= n 0)
	  zero
	  (add-1 (church-number (- n 1)))))

;; http://www.billthelizard.com/2010/10/sicp-26-church-numerals.html
(define (church-plus m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(define (church-mult m n)
  (lambda (f) (m (n f))))

(define (church-exp m n)
  (n m))
