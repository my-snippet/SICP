(define (foldl f initial xs)
  (if (null? xs)
	  initial
	  (f (car xs) (foldl f initial (cdr xs)))))

(define (foldr f initial xs)
  (if (null? xs)
	  initial
	  (f (foldr f initial (cdr xs)) (car xs))))
