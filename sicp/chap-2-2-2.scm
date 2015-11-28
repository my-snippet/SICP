(define (foldl f initial xs)
  (if (null? xs)
	  initial
	  (f (car xs) (foldl f initial (cdr xs)))))
