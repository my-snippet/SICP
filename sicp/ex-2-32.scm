;; Anyway, lists like (1 2 nil) only can be made by appending other data.
;; because selectors for list cannot select (1 2 nil) in (1 2 3 nil)
;; that is, function in map should append(or cons up) (car s) & other data
;; or list  

;; The line (let ((rest (subsets (cdr s)))) calls the subsets recursively
;; until it will be nil,
;; 1. at that time subsets returns (list nil) and (car s) = 3, then
;; (append (nil) (3)) makes (() (3))
;; 2. rest = (() (3)), (car s) = 2, then
;; (append rest ((cons 2 nil) (cons 2 3))) makes (() (3) (2) (2 3))
;; 3. rest = (() (3) (2) (2 3)), (car s) = 1, then
;; (append rest ((cons 1 nil) (cons 1 3) (cons 1 2) (cons 1 (2 3))))
;; = (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))


(define (subsets s)
  (if (null? s)
	  (list '())
	  (let ((rest (subsets (cdr s))))
		(append rest (map (lambda (x) (cons (car s) x)) rest)))))
