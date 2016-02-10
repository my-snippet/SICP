;; https://en.wikipedia.org/wiki/Church_encoding


(define zero (lambda (f) (lambda (x) x)))

;; this is equivalent to the successor. (see 'wikipedia' link above)
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (succ n)
  (add-1 n))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define three (succ two))

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


(define value
  (lambda (v) (lambda (h) (h v))))

(define inc
  (lambda (g) (lambda (h) (h (g f)))))

(define church-identity
  (lambda (u) u))

(define const
  (lambda (u) x))

(define (extract k)
  (k church-identity))

;; lisp version reference:
;; http://b.yf.io/?p=93
;; http://www.jdxyw.com/?p=1098
;; sub-1 is equal to predecessor
(define (sub-1 n)
  (lambda (f)
	(lambda (x)
	  (((n (lambda (g)
			 (lambda(h)
			   (h (g f)))))
		(lambda (u) x))
	   (lambda (u) u)))))

(define (pred n)
  (sub-1 n))

;; pred : named version
;; I used internal lambda because of variable scope 
(define (pred_ n)
   (lambda (f)
	(lambda (x)
	  (((n (let ((inc (lambda (g) (lambda(h) (h (g f))))))
			 inc))
		(let ((const (lambda (u) x)))
		  const))
	   (let ((church-identity (lambda (u) u)))
		 church-identity)))))

(define (church-minus m n)
  ((n pred) m))

(define (church-encode n)
  (if (= n 0)
	  (lambda (f) (lambda (x) x))
	  (lambda (f) (lambda (x) (f (((church-encode (- n 1)) f) x))))))

(define (church-decode cn)
  ((cn (lambda (x) (+ x 1))) 0))
