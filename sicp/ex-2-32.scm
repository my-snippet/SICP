;; Anyway, lists like (1 2 nil) only can be made by appending other data.
;; because selectors for list cannot select (1 2 nil) in (1 2 3 nil)
;; that is, function in map should append(or cons up) (car s) & other data
;; or list  

;; The line (let ((rest (subsets (cdr s)))) calls the subsets recursively
;; until it will be nil,
;; 1. at that time subsets returns '(), therefore '() will appears first,
;; 2. and then, 3 and '() will be consed up to be (3)
;; 3. and then, 2 and '() will be consed up to be (2)
;; 4. and then, 2 and (3) will be consed up to be (2 3)

;; in progress 
;; Why 2. 3. happen successively? : because subsets is called when it is
;; to be '(), it first evaluates 3, and then evaluates 2


(define (subsets s)
  (if (null? s)
	  (list '())
	  (let ((rest (subsets (cdr s))))
		(append rest (map (lambda (x) (cons (car s) x)) rest)))))
